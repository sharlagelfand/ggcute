fairyfloss_col <- function(...) {
  cols <- c(...)

  if(is.null(cols)) {
    return(fairyfloss_colours)
  }

  fairyfloss_colours[cols]
}

fairyfloss_colours <-
  c(
    dark_purple = "#5A5475",
    light_purple = "#B7A0CD",
    dark_pink = "#E3837D",
    light_pink = "#F5B6D0",
    dark_yellow = "#E9C062",
    light_yellow = "#FAF58A",
    mint = "#C0FFDE",
    blue = "#96CBFE",
    white = "#FFFFFF"
  )
