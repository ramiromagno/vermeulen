# Title: Biomarker data set from 10.1016/j.ymeth.2012.08.011.
#
# Description: The original data comes from Vermeulen (2009),
# 10.1016/S1470-2045(09)70154-8 but the link provided is broken ---
# http://medgen.ugent.be/jvermeulen. In 2012, Ruijter et al. (2013) used this
# data set for the benchmarking of qPCR tools, and provided this data set
# (dubbed biomarker data set) in their supplementary data:
#
#   - Source: https://medischebiologie.nl/wp-content/uploads/2019/02/qpcrdatamethods.zip
#   - Website: https://medischebiologie.nl/files/
#
# The archive qpcrdatamethods.zip included, inter alia, the folder
# datasets/biomarker_set/ with four files:
#
#   - Data_Vermeulen_A.xls
#   - Data_Vermeulen_B.xls
#   - Data_Vermeulen_C.xls
#   - Data_Vermeulen_D.xls
#
# These four files comprise the biomarker data set. The spreadsheet files
# contain raw fluorescence data from qPCR experiments.
#
# There are 4 spreadsheet files with 16 sheets each (64 in total). Each sheet
# refers to one  gene out of the 64 genes evaluated (59 biomarker + 5 reference
# genes). Each sheet refers to a 384-well plate qPCR experiment:
#   - 366 cDNA samples (1 replicate)
#   - 18 dilution series samples (10-fold 5-point dilution series x 3 replicates + NTC x 3 replicates).
#
# In total, the biomarker dataset comprises a matrix of 64 genes x 384 samples =
# 24,576 amplification curve series.
#

library(tidyverse)
library(readxl)
library(float)

data_dir <- here::here("data-raw")
archive_path <- file.path(data_dir, "qpcrdatamethods.zip")
data_files <- dplyr::pull(dplyr::filter(unzip(archive_path, list = TRUE), grepl("Data_Vermeulen", x = Name)), 1L)
unzip(archive_path, files = data_files, exdir = data_dir)
data_file_path <- purrr::set_names(file.path(data_dir, data_files))

# Each spreadsheet is a qPCR plate, and each plate contained the samples related
# to one gene only.
sheets <-
  purrr::map(data_file_path, readxl::excel_sheets) %>%
  purrr::map(~grep(pattern = "Sheet*", x = .x, value = TRUE, invert = TRUE)) %>%
  purrr::map_dfr(.f = ~ tibble::tibble(sheet = .x), .id = "file") %>%
  dplyr::mutate(gene_date = sheet) %>%
  tidyr::separate(col = "gene_date", into = c("gene", "date"), sep = "_", extra = "drop") %>%
  dplyr::mutate(date = as.Date(date, format = "%Y%m%d"))

# NB: Because each of the 384-well plates refers to samples of the same gene, we
# use the name of the gene as the name for the plate.
read_amplification_data <- function(file, sheet, gene) {

  readxl::read_excel(path = file, sheet = sheet) %>%
    tidyr::pivot_longer(cols = -(1:2), names_to = "cycle", values_to = "fluor") %>%
    dplyr::mutate(plate = gene, dye = "SYBR", cycle = as.double(cycle)) %>%
    dplyr::rename(well = "Well")
}


excel_data <-
  sheets %>%
  dplyr::select(c("file", "sheet", "gene")) %>%
  purrr::pmap_dfr(read_amplification_data)

# `reactions`: Metadata associated with each qPCR well, i.e. PCR reaction.
reactions <-
  excel_data %>%
  dplyr::distinct(plate, well, Sample, dye) %>%
  dplyr::mutate(plate = stringr::str_remove(plate, r"{\(.*\)}"),
                target = plate) %>%
  dplyr::relocate(plate, well, Sample) %>%
  dplyr::rename(sample = "Sample") %>%
  dplyr::mutate(sample_type = dplyr::case_when(
    grepl(pattern = "STD", sample) ~ "std",
    grepl(pattern = "water", sample) ~ "ntc",
    TRUE ~ "unk"
  )) %>%
  tidyr::separate(col = "sample", into = c("standard", "dilution"), sep = "_", remove = FALSE, fill = "right") %>%
  dplyr::mutate(dilution = as.double(dilution)) %>%
  dplyr::mutate(dilution = dplyr::if_else(sample == "water", Inf, dilution),
                target = dplyr::if_else(sample == "water", NA_character_, target)) %>%
  dplyr::select(-"standard") %>%
  dplyr::relocate(plate, well, dye, sample, target, sample_type, dilution) %>%
  dplyr::mutate(
    plate = factor(plate),
    well = factor(well),
    dye = factor(dye),
    target = factor(target),
    sample_type = factor(sample_type)
  )

# `targets`
#
# The annotation of the reference genes was found by reading the Supplementary
# webappendix, page 3 of Vermeulen J, Preter KD, Naranjo A, et al. Predicting outcomes
# for children with neuroblastoma using a multigene-expression signature: a
# retrospective SIOPEN/COG/GPOH study. Lancet Oncol 2009; published online June
# 9, 2009. DOI:10.1016/S1470-2045(09)70154-8.
# URL: https://ars.els-cdn.com/content/image/1-s2.0-S1470204509701548-mmc1.pdf
#
ref_genes <- c("HPRT1", "SDHA", "UBC", "HMBS", "ALUsq")

targets <-
  reactions %>%
  dplyr::distinct(target) %>%
  tidyr::drop_na(target) %>% # NTCs have `target` == NA.
  dplyr::mutate(target_type = as.factor(dplyr::if_else(target %in% ref_genes, "ref", "toi")))


# `samples`
#
#
samples <-
  dplyr::distinct(reactions, sample, sample_type, dilution) %>%
  dplyr::arrange(sample, sample_type, dilution)

# Because we have already these two columns in `samples`, there is not need
# to keep them in the `reactions` data frame too.
reactions <- dplyr::select(reactions, -c("sample_type", "dilution"))

# `amplification_curves`: amplification curve data (raw fluorescence data).
amplification_curves <-
  excel_data %>%
  dplyr::select(-"Sample") %>%
  dplyr::mutate(plate = stringr::str_remove(plate, r"{\(.*\)}")) %>%
  dplyr::mutate(
    plate = factor(plate),
    well = factor(well),
    dye = factor(dye),
    cycle = as.integer(cycle),
    fluor = as.double(fluor)
  ) %>%
  dplyr::relocate(plate, well, dye, cycle, fluor)


readr::write_csv(reactions, file = file.path(data_dir, "reactions.csv.gz"))
readr::write_csv(samples, file = file.path(data_dir, "samples.csv.gz"))
readr::write_csv(targets, file = file.path(data_dir, "targets.csv.gz"))
readr::write_csv(amplification_curves, file = file.path(data_dir, "amplification_curves.csv.gz"))
