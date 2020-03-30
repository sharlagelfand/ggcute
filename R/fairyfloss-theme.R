#' Fairyfloss theme
#'
#' A very cute ggplot2 theme based off \href{https://twitter.com/sailorhg}{sailorhg}'s \href{https://sailorhg.github.io/fairyfloss/}{fairyfloss} text editor theme
#'
#' @inheritParams ggplot2::theme_grey
#'
#' @rdname fairyfloss
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
