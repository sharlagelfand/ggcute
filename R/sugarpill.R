#' Sugarpill Fun Size theme
#'
#' A very cute ggplot2 theme based off the Sugarpill Fun Size Palette
#'
#' @inheritParams ggplot2::theme_grey
#'
#' @rdname theme_sugarpill
#' @export
#'
#' @examples
#' library(ggplot2)
#' ggplot(nintendo_sales, aes(x = sales_million, y = console, fill = console)) +
#'   geom_col() +
#'   facet_wrap(~sales_type) +
#'   scale_fill_sugarpill() +
#'   theme_sugarpill()
#' @importFrom ggplot2 element_rect element_line element_text element_blank theme theme_grey
theme_sugarpill <- function(base_size = 12, base_line_size = base_size / 22, base_rect_size = base_size / 22) {
  theme_grey(base_size = base_size, base_line_size = base_line_size, base_rect_size = base_rect_size)
    theme(
      plot.background = element_rect(fill = sugarpill_col("front"), colour = sugarpill_col("front")),
      panel.background = element_rect(fill = sugarpill_col("background")),
      panel.grid.major = element_line(colour = sugarpill_col("front")),
      panel.grid.minor = element_blank(),
      plot.title = element_text(colour = sugarpill_col("silver"), face = "bold.italic"),
      plot.subtitle = element_text(colour = sugarpill_col("silver"), face = "italic"),
      axis.title = element_text(colour = sugarpill_col("silver"), face = "bold.italic"),
      axis.text = element_text(colour = sugarpill_col("grey")),
      axis.ticks = element_line(colour = sugarpill_col("grey")),
      legend.background = element_blank(),
      legend.title = element_text(colour = sugarpill_col("silver"), face = "bold.italic"),
      legend.text = element_text(colour = sugarpill_col("grey")),
      legend.key = element_rect(fill = sugarpill_col("background"), colour = NA),
      strip.background = element_rect(fill = NA, color = sugarpill_col("background"), linetype = "dotted", size = 1),
      strip.text = element_text(colour = sugarpill_col("grey"), face = "bold")
    )
}

#' Sugarpill color scale
#'
#' @param discrete Whether the colour aesthetic is discrete or not
#' @param reverse Whether the palette should be reversed
#' @param ... Additional arguments
#'
#' @rdname scale_colour_sugarpill
#' @export
#'
#' @examples
#' library(ggplot2)
#' ggplot(nintendo_sales, aes(x = sales_million, y = console, colour = sales_type)) +
#'   geom_point() +
#'   scale_color_sugarpill() +
#'   theme_sugarpill()
#' @importFrom ggplot2 discrete_scale scale_color_gradientn
scale_colour_sugarpill <- function(discrete = TRUE, reverse = FALSE, ...) {
  pal <- sugarpill_pal(reverse = reverse)

  if (discrete) {
    discrete_scale("colour", "sugarpill", palette = pal, ...)
  } else {
    scale_color_gradientn(colours = pal(256), ...)
  }
}

#' Sugarpill fill scale
#'
#' @inheritParams scale_colour_sugarpill
#'
#' @export
#'
#' @examples
#' library(ggplot2)
#' ggplot(nintendo_sales, aes(x = sales_million, y = console, fill = sales_type)) +
#'   geom_col() +
#'   scale_fill_sugarpill() +
#'   theme_sugarpill()
#' @importFrom ggplot2 discrete_scale scale_fill_gradientn
scale_fill_sugarpill <- function(discrete = TRUE, reverse = FALSE, ...) {
  pal <- sugarpill_pal(reverse = reverse)

  if (discrete) {
    discrete_scale("fill", "sugarpill", palette = pal, ...)
  } else {
    scale_fill_gradientn(colours = pal(256), ...)
  }
}

#' @importFrom grDevices colorRampPalette
sugarpill_pal <- function(reverse = FALSE, ...) {
  pal <- sugarpill_col()
  pal <- pal[!(names(pal) %in% c("front", "background", "silver", "grey"))]

  if (reverse) {
    pal <- rev(pal)
  }
  colorRampPalette(pal, ...)
}

#' @export
#' @rdname scale_colour_sugarpill
scale_color_sugarpill <- scale_colour_sugarpill

sugarpill_col <- function(...) {
  cols <- c(...)

  if(is.null(cols)) {
    return(sugarpill_colours)
  }

  sugarpill_colours[cols]
}

sugarpill_colours <-
  c(silver = "#E9E9EA",
    grey = "#5D5D5D",
    front = "#FCABCC",
    background = "#E4DD68",
    `cheat code` = "#7EBBAC",
    `8-bit` = "#797CD9",
    `player one` = "#C363C7",
    twitch = "#9FD391",
    `level up` = "#F5527F",
    `rage quit` = "#EA4A92",
    `continue?` = "#D7AD34",
    `high score` = "#FE9134",
    `game over` = "#ED4030"
  )
