test_that("biomarker data set", {

  biomarker <- get_biomarker_dataset()
  cols <- c("plate", "well", "dye", "target", "target_type", "sample",
            "sample_type", "copies", "dilution", "cycle", "fluor")

  # Expected columns
  expect_named(biomarker, cols)

  # Number of rows
  expect_equal(nrow(biomarker), 1226880L)

  # Number of amplification curves
  n_curves <- nrow(unique(biomarker[c("plate", "well")]))
  expect_equal(n_curves, 24576L)

  # Wells
  wells <- levels(biomarker$well)
  expect_equal(wells, wells())
})
