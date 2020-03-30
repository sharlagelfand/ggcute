#' Fairyfloss theme
#'
#' A very cute ggplot2 theme based off \href{https://twitter.com/sailorhg}{sailorhg}'s \href{https://sailorhg.github.io/fairyfloss/}{fairyfloss} text editor theme
#'
#' @inheritParams ggplot2::theme_grey
#'
#' @rdname theme_fairyfloss
#' @export
#'
#' @examples
#' library(ggplot2)
#' ggplot(nintendo_sales, aes(x = sales_million, y = console)) +
#'   geom_col() +
#'   facet_wrap(~sales_type) +
#'   theme_fairyfloss()
#' @importFrom ggplot2 element_rect element_line element_text element_blank theme theme_grey
theme_fairyfloss <- function(base_size = 16, base_family = "Courier", base_line_size = base_size / 22, base_rect_size = base_size / 22) {
  theme_grey(base_size = base_size, base_family = base_family, base_line_size, base_rect_size) +
    theme(
      plot.background = element_rect(fill = fairyfloss_col("dark_purple"), colour = fairyfloss_col("light_purple")),
      panel.background = element_rect(fill = fairyfloss_col("light_purple")),
      panel.grid.major = element_line(colour = fairyfloss_col("blue")),
      panel.grid.minor = element_blank(),
      axis.text = element_text(colour = fairyfloss_col("dark_yellow")),
      axis.title = element_text(colour = fairyfloss_col("mint")),
      plot.title = element_text(colour = fairyfloss_col("dark_pink"), hjust = 0.5),
      plot.subtitle = element_text(colour = fairyfloss_col("dark_pink"), hjust = 0.5),
      legend.background = element_rect(fill = NA, colour = fairyfloss_col("light_purple")),
      legend.title = element_text(colour = fairyfloss_col("light_pink")),
      legend.text = element_text(colour = fairyfloss_col("white")),
      legend.key = element_rect(fill = NA),
      strip.background = element_rect(fill = fairyfloss_col("light_pink")),
      strip.text = element_text(colour = fairyfloss_col("white"))
    )
}

#' Fairyfloss color scale
#'
#' @param discrete Whether the colour aesthetic is discrete or not
#' @param reverse Whether the palette should be reversed
#' @param ... Additional arguments
#'
#' @rdname scale_colour_fairyfloss
#' @export
#'
#' @examples
#' library(ggplot2)
#' ggplot(nintendo_sales, aes(x = sales_million, y = console, colour = sales_type)) +
#'   geom_point() +
#'   scale_color_fairyfloss() +
#'   theme_fairyfloss()
#' @importFrom ggplot2 discrete_scale scale_color_gradientn
scale_colour_fairyfloss <- function(discrete = TRUE, reverse = FALSE, ...) {
  pal <- fairyfloss_pal(reverse = reverse)

  if (discrete) {
    discrete_scale("colour", "fairyfloss", palette = pal, ...)
  } else {
    scale_color_gradientn(colours = pal(256), ...)
  }
}

#' Fairyfloss fill scale
#'
#' @inheritParams scale_colour_fairyfloss
#'
#' @export
#'
#' @examples
#' library(ggplot2)
#' ggplot(nintendo_sales, aes(x = sales_million, y = console, fill = sales_type)) +
#'   geom_col() +
#'   scale_fill_fairyfloss() +
#'   theme_fairyfloss()
#' @importFrom ggplot2 discrete_scale scale_fill_gradientn
scale_fill_fairyfloss <- function(discrete = TRUE, reverse = FALSE, ...) {
  pal <- fairyfloss_pal(reverse = reverse)

  if (discrete) {
    discrete_scale("fill", "fairyfloss", palette = pal, ...)
  } else {
    scale_fill_gradientn(colours = pal(256), ...)
  }
}

#' @importFrom grDevices colorRampPalette
fairyfloss_pal <- function(reverse = FALSE, ...) {
  pal <- fairyfloss_col()
  pal <- pal[!(names(pal) %in% c("dark_purple", "light_purple", "white"))]

  if (reverse) {
    pal <- rev(pal)
  }
  colorRampPalette(pal, ...)
}

#' @export
#' @rdname scale_colour_fairyfloss
scale_color_fairyfloss <- scale_colour_fairyfloss

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
