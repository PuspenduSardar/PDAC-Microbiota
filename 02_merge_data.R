############################################
# Merge bile/tissue datasets
############################################
source("01_load_packages.R")

merged_tables <- flipTables::Cbind(benign_bile_tissue, btc_bile_tissue, pdac_bile_tissue)

write.table(merged_tables, 
            file = "output/merged_tables.txt", sep = "\t", quote = FALSE, dec = ".", 
            row.names = FALSE)
