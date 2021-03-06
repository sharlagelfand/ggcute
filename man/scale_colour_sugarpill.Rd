% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sugarpill.R
\name{scale_colour_sugarpill}
\alias{scale_colour_sugarpill}
\alias{scale_color_sugarpill}
\title{Sugarpill color scale}
\usage{
scale_colour_sugarpill(discrete = TRUE, reverse = FALSE, ...)

scale_color_sugarpill(discrete = TRUE, reverse = FALSE, ...)
}
\arguments{
\item{discrete}{Whether the colour aesthetic is discrete or not}

\item{reverse}{Whether the palette should be reversed}

\item{...}{Additional arguments}
}
\description{
Sugarpill color scale
}
\examples{
library(ggplot2)
ggplot(nintendo_sales, aes(x = sales_million, y = console, colour = sales_type)) +
  geom_point() +
  scale_color_sugarpill() +
  theme_sugarpill()
}
