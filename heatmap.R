############################################
# Load required libraries
############################################
library(ggplot2)
library(pheatmap)
library(tidyverse)


############################################
# Z-score scaling for tissue samples
# - Removes first column (species) before scaling
# - Transforms each feature to mean = 0, sd = 1
############################################
data_zscore <- as.data.frame(scale(tissue_samples_min5_norm[,-1]))
rownames(data_zscore) <- tissue_samples_min5_norm$Genus  # Add species names back

############################################
# Prepare raw data for PDAC bile samples (genus-level)
############################################
raw_data <- as.data.frame(PDAC_bile_norm[,-1])
rownames(raw_data) <- PDAC_bile_norm$Genus

############################################
# Prepare PDAC metadata (DFS, OS columns)
############################################
PDAC_meta_mod_symb <- PDAC_tissue_meta_symb %>% select(DFS, OS)
rownames(PDAC_meta_mod_symb) <- PDAC_tissue_meta_symb$mSample

############################################
# Prepare read count data (min 5% prevalence filter)
############################################
raw_data_read <- as.data.frame(tissue_samples_min5pct[,-1])
rownames(raw_data_read) <- tissue_samples_min5pct$Genus

############################################
# Quick inspection of scaled data
############################################
head(data_zscore)

############################################
# Prepare tissue metadata table
############################################
tissue_metadata <- as.data.frame(all_tissue_metadata[,-1])
rownames(tissue_metadata) <- all_tissue_metadata$Sample

############################################
# Heatmap: PDAC bile samples at genus level
############################################
pheatmap(raw_data, 
         cluster_rows = FALSE, 
         cluster_cols = FALSE,
         show_rownames = TRUE,    # Show species names
         show_colnames = FALSE,   # Hide metabolite names
         annotation_col = PDAC_meta_mod_symb,  # Annotate columns with metadata
         main = "Heatmap of PDAC bile samples at genus level",
         fontsize = 8,
         filename = "figure/PDAC_bile_heatmap.pdf",
         width = 7,
         height = 8)

############################################
# Statistical test: t-test for each genus vs. OS status
############################################
stat_test <- as.data.frame(PDAC_bile_for_stat)
stat_test$Status <- PDAC_meta_mod_symb$OS

# Perform t-tests for each genus except the 454th column (?)
# WARNING: hard-coded [-454] suggests fragile indexing — better to select by name
t.result <- t(sapply(stat_test[-454], function(x) {
  tt <- t.test(x ~ stat_test$Status)
  unlist(tt[c("estimate", "p.value", "statistic", "conf.int")])  # Removed "p.adj" — t.test does not output this
}))
t.result <- as.data.frame(t.result)

write.table(t.result, 
            file = "output_file/PDAC_bile_genus_ttest_result.txt", 
            sep = "\t", quote = FALSE, dec = ".", row.names = TRUE)

############################################
# Statistical test: Wilcoxon rank-sum test for each genus
############################################
will_test <- data.frame(
  stats_w = apply(subset(stat_test, select = -Status), 2, 
                  function(y) wilcox.test(y ~ stat_test$Status, exact = FALSE)$statistic),
  p_w     = apply(subset(stat_test, select = -Status), 2, 
                  function(y) wilcox.test(y ~ stat_test$Status, exact = FALSE)$p.value)
)

# Adjust p-values using Benjamini-Hochberg correction
will_df <- as.data.frame(will_test)
will_df$BH_padj <- p.adjust(will_df$p_w, method = "BH")

write.table(will_df, 
            file = "output_file/PDAC_bile_genus_will_padj_result.txt", 
            sep = "\t", quote = FALSE, dec = ".", row.names = TRUE)

############################################
# Heatmap: Z-scored metabolite production by species
############################################
pheatmap(data_zscore, 
         cluster_rows = TRUE, 
         cluster_cols = TRUE, 
         show_rownames = TRUE,   
         show_colnames = TRUE,   
         main = "Heatmap of Metabolite Production (Z-scored) by Species",
         filename = "SCFA_metabolite_heatmap.pdf",
         width = 8,
         height = 7)
