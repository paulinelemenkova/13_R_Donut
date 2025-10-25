# load library
library(ggplot2)
library(dplyr) # For data manipulation, especially for calculating percentages
library(readr)

# Load CSV file
data <- read_csv("FAOSTAT_short.csv")
head(data)
 
# Example data preparation (adjust column names as per your CSV)
data_prepared <- data %>%
  group_by(Item) %>% # Replace 'category_column' with your actual category column
  summarise(Value = sum(refValue)) %>% # Replace 'value_column' with your actual value column
  mutate(
    fraction = Value / sum(Value),
    ymax = cumsum(fraction),
    ymin = c(0, head(ymax, n = -1))
  )


# Define the hole size
donut_hole_size <- 2.0 # Adjust this value to control the size of the hole

p<- ggplot(data_prepared, aes(ymax = ymax, ymin = ymin, xmax = 4, xmin = 4 -
    donut_hole_size, fill = Item, inewidth=0.1)) +
    geom_rect() +
    coord_polar(theta = "y") +
        xlim(c(0, 4)) + # Adjusted x limits based on donut_hole_size
    labs(title = "Market share of major agriculture products in India: 2023") +
#    geom_text(aes(label = Item), position = position_stack(vjust = 0.5)) +
    geom_text(aes(x = 3.5, y = ymax*0.97, label = paste0(round(fraction * 100), "%")), color = "white", size = 4) +
    scale_alpha_continuous() +
    scale_fill_brewer(palette = "Paired")
p

geom_text(aes(label = Item, x="", y=""), position = position_stack(vjust = 0.5)) +




library(ggplot2)

# data
data <- read_csv("FAOSTAT_short.csv")
head(data)

# Calculate percentages and label positions
data$fraction <- data$count / sum(data$count)
data$ymax <- cumsum(data$fraction)
data$ymin <- c(0, head(data$ymax, n = -1))
data$label_pos <- (data$ymin + data$ymax) / 2 # Midpoint for labels

# Create the donut chart with geom_text labels
ggplot(data, aes(ymax = ymax, ymin = ymin, xmax = 4, xmin = 3, fill = Item)) +
  geom_rect() +
  coord_polar(theta = "y") +
  xlim(c(2, 4)) + # Creates the hole for the donut
  geom_text(aes(x = 3.5, y = ymax, label = paste0(round(fraction * 100), "%")),
            color = "white", size = 4) + # Adds percentage labels
  theme_void() # Removes axes and background
