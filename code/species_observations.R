#install.packages('fs')
fs::dir_tree(path = ".", recurse = TRUE)

# output directory 
output_dir <- './data/output/'

# import species observations 
species_observations <- read.csv(paste0(output_dir,'01_species_observations.csv'),
                                   sep=';',
                                   header=TRUE)

# counts per species 
counts_per_species <- plyr::count(species_observations$species_name)

# create output directory 
if(!dir.exists(output_dir)){
  dir.create(output_dir)
}

# export table 
write.table(counts_per_species,
            paste0(output_dir,'01_counts_per_species.csv'),
            row.names = FALSE)

# install packages 
install.packages(c(
  "tidyverse", 
  "terra", "stars",
  "mapview", "mapedit", 
  "move2", "amt",
  "knitr", 
  "data.table", 
  "lubridate", 
  "targets"
))

git config --global user.name "M-Tladi"
git config --global user.email "201000042@ub.ac.bw"

# Store your token securely
gitcreds::gitcreds_set()
gitcreds::gitcreds_get()
