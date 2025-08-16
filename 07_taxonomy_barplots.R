############################################
# Taxonomy barplots
############################################
source("01_load_packages.R")

genus2str <- read.delim("taxonomy_barplot/genus2str.txt")
DT.m1 <- melt(genus2str,
              measure.vars = c("Enterobacter", "Klebsiella", "Streptococcus", "Plesiomonas", 
                               "Citrobacter", "Veillonella", "Vibrio", "Citrobacter_A", "Providencia", 
                               "Escherichia", "Yersinia", "Aeromonas", "Staphylococcus", "Pantoea", 
                               "Phytobacter", "Enterococcus_B", "Kluyvera", "Haemophilus_D", "Salmonella", 
                               "Lactobacillus", "Proteus", "Others"),
              variable.name = "Genus", value.name = "Abundance")

write.table(DT.m1, file = "output/genus_structure.txt", sep = "\t", quote = FALSE, dec = ".", row.names = TRUE)
