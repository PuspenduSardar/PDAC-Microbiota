############################################
# Alpha diversity analysis
############################################
source("01_load_packages.R")

OTU_tab  <- otu_table(as.matrix(abund_tab), taxa_are_rows = TRUE)
tax_tab  <- tax_table(as.matrix(taxonomy))
meta_tab <- sample_data(metadata)
physeq   <- phyloseq(OTU_tab, tax_tab, meta_tab)

sample_sum_df <- data.frame(sum = sample_sums(physeq))
ggplot(sample_sum_df, aes(x = sum)) + 
  geom_histogram(color = "black", fill = "cadetblue", binwidth = 1000)

alpha_div <- c("Shannon", "Chao1", "Simpson", "InvSimpson", "Observed", "ACE")
p <- plot_richness(physeq, "Type", measures = alpha_div)
alpha_div_df <- p$data
write.table(alpha_div_df, file = "output/alpha_div_matrices.txt", sep = "\t", dec = ".", row.names = FALSE, quote = FALSE)
