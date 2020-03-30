# Source: https://www.nintendo.co.jp/ir/en/finance/hard_soft/index.html
# As of December 31, 2019

library(tibble)

nintendo_sales <- tribble(
  ~console, ~sales_type, ~sales_million,
  "Nintendo Switch", "Hardware", 52.48,
  "Nintendo Switch", "Software", 310.65,
  "Nintendo 3DS", "Hardware", 75.71,
  "Nintendo 3DS", "Software", 382.22,
  "Wii U", "Hardware", 13.56,
  "Wii U", "Software", 103.01,
  "Wii", "Hardware", 101.63,
  "Wii", "Software", 921.41,
  "Nintendo DS", "Hardware", 154.02,
  "Nintendo DS", "Software", 948.69,
  "Game Boy Advance", "Hardware", 81.51,
  "Game Boy Advance", "Software", 377.42,
  "Game Boy", "Hardware", 118.69,
  "Game Boy", "Software", 501.11,
  "Nintendo GameCube", "Hardware", 21.74,
  "Nintendo GameCube", "Software", 208.57,
  "Nintendo 64", "Hardware", 32.93,
  "Nintendo 64", "Software", 224.97,
  "SNES", "Hardware", 49.10,
  "SNES", "Software", 379.06,
  "NES", "Hardware", 61.91,
  "NES", "Software", 500.01
)

usethis::use_data(nintendo_sales, overwrite = TRUE)
