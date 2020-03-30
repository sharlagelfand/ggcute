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

#' @export
#' @rdname scale_colour_fairyfloss
scale_color_fairyfloss <- scale_colour_fairyfloss

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
