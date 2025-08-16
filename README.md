# PDAC Microbiota Analysis Pipeline

This repository contains a modular R-based analysis workflow for bile and tissue microbiome data.

---

## 📂 Folder Structure

```text
project/
│
├── 01_load_packages.R              # Load required libraries
├── 02_merge_data.R                 # Merge bile/tissue datasets
├── 03_stat_tests.R                 # t-tests and Wilcoxon rank-sum tests
├── 04_pca_analysis.R               # PCA visualizations
├── 05_venn_diagrams.R              # Venn diagram comparisons
├── 06_boxplots.R                   # Boxplots using ggstatsplot
├── 07_taxonomy_barplots.R          # Genus-level taxonomy plots
├── 08_alpha_diversity.R            # Alpha diversity calculations
├── 09_misc_tests.R                 # Miscellaneous test examples
├── run_all.R                       # Master script to run everything
├── heatmap.R                       # Script for heatmap
├── PDAC_microbiota_confounding.nb  # HTML file created with R Markdown for confounding effect
│
├── data/                      # All raw input files
├── output/                    # Generated tables and plots


---

## 🚀 Running the Analysis

1. **Install R and RStudio**  
   Make sure you have R ≥ 4.0 and RStudio installed.

2. **Install Required Packages**  
   The pipeline will load these automatically:
   - `ggplot2`
   - `pheatmap`
   - `tidyverse`
   - `factoextra`
   - `VennDiagram`
   - `ggstatsplot`
   - `here`
   - `reshape2`
   - `phyloseq`
   - `flipTables`
   - `devtools`

3. **Set Your Working Directory**  
   Place all scripts in the project folder and open `run_all.R` in RStudio.  
   Make sure your `data/` folder contains all required CSV/TXT input files.

4. **Run the Full Pipeline**  
   In RStudio console:
   ```r
   source("run_all.R")
   
5. Check Results
    Tables will be saved in output/ as .txt or .csv
    Plots will be saved in output/ as .pdf
    

🧩 Modular Workflow

You can run each step individually:
source("03_stat_tests.R")  # Only run statistical tests
This is useful if you only want to rerun certain parts of the analysis.


📌 Notes
Update file paths in scripts if your data/ folder is located elsewhere.
Large datasets may take several minutes to process.
If you encounter missing package errors, install them using:
install.packages("package_name")


📜 License

MIT License – feel free to use, modify, and share.