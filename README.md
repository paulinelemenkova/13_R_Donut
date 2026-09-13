# R Donut Charts (ggplot2)

R scripts drawing donut (ring) charts of categorical proportions with ggplot2, built by mapping a stacked bar to polar coordinates and cutting out the centre with an x-axis limit. Example data are FAOSTAT agricultural production shares.

## Scripts

- 13_Donut_example.R: a minimal donut from a small data frame (compute fraction, cumulative ymax/ymin, geom_rect + coord_polar(theta = "y"), xlim to open the hole).

- 13_Donut_25102025.R: a donut of FAOSTAT category shares (read_csv, tidyverse), with labels and a viridis/Brewer fill.

## Methods

- Donut chart: stacked proportion bar under a polar-coordinate transform with an inner radius; part-to-whole visualisation.

## Data

- FAOSTAT_2000.csv, FAOSTAT_short.csv: agricultural production values by item (example data).

## Requirements

- R (>= 4.0); packages: ggplot2, dplyr, readr

## Author

Polina Lemenkova — ORCID https://orcid.org/0000-0002-5759-1089

## License

MIT — see LICENSE (Copyright Polina Lemenkova).
