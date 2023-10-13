# Required package
library(readr)

# Define upper and lower possible scores
min_score <- 1
max_score <- 4

# Set file path and file name
path <- "your/directory/path/here"
data_file <- "your_data_file.csv"

# Combine path and file name
full_path <- file.path(path, data_file)

# Read data from CSV file into a data frame
data <- read_csv(full_path)

# List of items to be reverse-scored
items_to_reverse <- c("item_1", 
                      "item_4",
                      "item_10")  # Replace with actual column names

# Reverse-scoring the specified items
for (item in items_to_reverse) {
  data[[item]] <- max_score + min_score - data[[item]]
}

# Save the reverse-scored data back to a CSV file, creating the new file name with a 'reversed_' prefix
new_file_name <- paste0("reversed_", data_file)
new_full_path <- file.path(path, new_file_name)

# Save the modified data frame to a new CSV file
write_csv(data, new_full_path)
