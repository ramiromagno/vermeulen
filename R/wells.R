wells <- function(layout = "16x24") {

  # If layout is a 384 well plate
  # 16 rows: A..P
  # 24 cols: 1--24
  # The well identifiers are generated in row-major order.
  if (identical(layout, "16x24")) {
  as.character(matrix(
    outer(LETTERS[1:16], 1:24, paste0),
    byrow = TRUE,
    nrow = 24
  ))
  }
}
