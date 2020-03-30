#' Fairyfloss theme
#'
#' A very cute ggplot2 theme based off \href{https://twitter.com/sailorhg}{sailorhg}'s \href{https://sailorhg.github.io/fairyfloss/}{fairyfloss} text editor theme
#'
#' @inheritParams ggplot2::theme_grey
#'
#' @return
#' @export
#'
#' @examples
#' library(ggplot2)
#' ggplot(nintendo_sales, aes(x = sales_million, y = console)) +
#'   geom_col() +
#'   facet_wrap(~ sales_type) +
#'   theme_fairyfloss()
#'
#' @importFrom ggplot2 element_rect element_line element_text element_blank theme theme_grey
theme_fairyfloss <- function(base_size = 16, base_family = "Courier", base_line_size = base_size/22, base_rect_size = base_size/22) {
  theme_grey(base_size = base_size, base_family = base_family, base_line_size, base_rect_size) +
    theme(
      plot.background = element_rect(fill = dark_purple, colour = light_purple),
      panel.background = element_rect(fill = light_purple),
      panel.grid.major = element_line(colour = blue),
      panel.grid.minor = element_blank(),
      axis.text = element_text(colour = yellow),
      axis.title = element_text(colour = mint),
      plot.title = element_text(colour = pink, hjust = 0.5),
      plot.subtitle = element_text(colour = pink, hjust = 0.5),
      legend.background = element_rect(fill = NA, colour = light_purple),
      legend.title = element_text(colour = light_pink),
      legend.text = element_text(colour = white),
      legend.key = element_rect(fill = NA),
      strip.background = element_rect(fill = light_pink),
      strip.text = element_text(colour = white)
    )
}

light_purple <- "#B7A0CD"
dark_purple <- "#5A5475"
yellow <- "#E9C062"
mint <- "#C0FFDE"
pink <- "#E3837D"
light_pink <- "#F5B6D0"
white <- "#FFFFFF"
blue <- "#96CBFE"
