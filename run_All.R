############################################
# Master Script: Run Complete Analysis
# Author: Puspendu Sardar, PhD
# Date: 15/08/2025
############################################

# Set working directory to project root
# (change path below if running outside the project folder)
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

cat("\n=== Starting full pipeline ===\n")

# 1. Load packages
cat("Step 1: Loading packages...\n")
source("01_load_packages.R")

# 2. Merge data
cat("Step 2: Merging datasets...\n")
source("02_merge_data.R")

# 3. Statistical tests
cat("Step 3: Running statistical tests...\n")
source("03_stat_tests.R")

# 4. PCA analysis
cat("Step 4: Running PCA analysis...\n")
source("04_pca_analysis.R")

# 5. Venn diagrams
cat("Step 5: Creating Venn diagrams...\n")
source("05_venn_diagrams.R")

# 6. Boxplots
cat("Step 6: Creating boxplots...\n")
source("06_boxplots.R")

# 7. Taxonomy barplots
cat("Step 7: Creating taxonomy barplots...\n")
source("07_taxonomy_barplots.R")

# 8. Alpha diversity
cat("Step 8: Calculating alpha diversity...\n")
source("08_alpha_diversity.R")

# 9. Miscellaneous tests
cat("Step 9: Running miscellaneous tests...\n")
source("09_misc_tests.R")

cat("\n=== Pipeline complete! Results saved in 'output/' folder ===\n")
