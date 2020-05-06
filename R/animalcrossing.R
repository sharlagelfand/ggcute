#' animalcrossing theme
#'
#' A ggplot2 theme based off \href{https://www.canva.com/colors/color-palette-generator/}{Canva}'s palette generator.
#' Palette generated on image of Nintendo Switch Animal Crossing New Horizons special edition.
#'
#' @inheritParams ggplot2::theme_grey
#'
#' @rdname theme_animalcrossing
#' @export
#'
#' @examples
#' library(ggplot2)
#' ggplot(nintendo_sales, aes(x = sales_million, y = console)) +
#'   geom_col() +
#'   facet_wrap(~sales_type) +
#'   theme_animalcrossing()
#' @importFrom ggplot2 element_rect element_line element_text element_blank theme theme_grey
#'
theme_animalcrossing <- function(base_size = 16, base_line_size = base_size / 22, base_rect_size = base_size / 22) {
  theme_grey(base_size = base_size, base_family = "Helvetica-Narrow", base_line_size, base_rect_size) +
    theme(
      plot.background = element_rect(fill = animalcrossing_col("beige"), colour = animalcrossing_col("sky_blue")),
      panel.background = element_rect(fill = animalcrossing_col("dark_sea_green")),
      panel.grid.major = element_line(colour = animalcrossing_col("peru")),
      panel.grid.minor = element_blank(),
      axis.ticks = element_line(colour = animalcrossing_col("peru")),
      axis.text = element_text(colour = animalcrossing_col("sienna")),
      axis.title = element_text(colour = animalcrossing_col("dark_slate")),
      plot.title = element_text(colour = animalcrossing_col("dark_slate"), hjust = 0.5),
      plot.subtitle = element_text(colour = animalcrossing_col("sienna"), hjust = 0.5),
      legend.background = element_rect(fill = NA, colour = animalcrossing_col("beige")),
      legend.title = element_text(colour = animalcrossing_col("sienna")),
      legend.text = element_text(colour = animalcrossing_col("sienna")),
      legend.key = element_rect(fill = NA),
      strip.background = element_rect(fill = animalcrossing_col("sienna")),
      strip.text = element_text(colour = animalcrossing_col("beige"))
    )
}

#' Animal Crossing color scale
#'
#' @param discrete Whether the colour aesthetic is discrete or not
#' @param reverse Whether the palette should be reversed
#' @param ... Additional arguments
#'
#' @rdname scale_colour_animalcrossing
#' @export
#'
#' @examples
#' library(ggplot2)
#' ggplot(nintendo_sales, aes(x = sales_million, y = console, colour = sales_type)) +
#'   geom_point() +
#'   scale_color_animalcrossing() +
#'   theme_animalcrossing()
#' @importFrom ggplot2 discrete_scale scale_color_gradientn
scale_colour_animalcrossing <- function(discrete = TRUE, reverse = FALSE, ...) {
  pal <- animalcrossing_pal(reverse = reverse)

  if (discrete) {
    discrete_scale("colour", "animalcrossing", palette = pal, ...)
  } else {
    scale_color_gradientn(colours = pal(256), ...)
  }
}

#' Animal Crossing fill scale
#'
#' @inheritParams scale_colour_animalcrossing
#'
#' @export
#'
#' @examples
#' library(ggplot2)
#' ggplot(nintendo_sales, aes(x = sales_million, y = console, fill = sales_type)) +
#'   geom_col() +
#'   scale_fill_animalcrossing() +
#'   theme_animalcrossing()
#' @importFrom ggplot2 discrete_scale scale_fill_gradientn
scale_fill_animalcrossing <- function(discrete = TRUE, reverse = FALSE, ...) {
  pal <- animalcrossing_pal(reverse = reverse)

  if (discrete) {
    discrete_scale("fill", "animalcrossing", palette = pal, ...)
  } else {
    scale_fill_gradientn(colours = pal(256), ...)
  }
}

#' @importFrom grDevices colorRampPalette
animalcrossing_pal <- function(reverse = FALSE, ...) {
  pal <- animalcrossing_col()
  pal <- pal[!(names(pal) %in% c("dark_purple", "light_purple", "white"))]

  if (reverse) {
    pal <- rev(pal)
  }
  colorRampPalette(pal, ...)
}

#' @export
#' @rdname scale_colour_animal_crossing
scale_color_animalcrossing <- scale_colour_animalcrossing

animalcrossing_col <- function(...) {
  cols <- c(...)

  if (is.null(cols)) {
    return(animalcrossing_colours)
  }

  animalcrossing_colours[cols]
}

animalcrossing_colours <-
  c(
    sky_blue = "#8EDCE6",
    beige = "#F5EADD",
    dark_slate = "#2F3939",
    dark_sea_green = "#A0CDA2",
    sienna = "#78512C",
    peru = "#C6923C"
  )
