############################################
# PCA analysis
############################################
source("01_load_packages.R")

df_pca_norm <- as.data.frame(comparison_Norm_pca[-65, ])
df_pca      <- as.data.frame(comparison_pca[-65, ])

nozero_col       <- df_pca_norm[, colSums(df_pca_norm) != 0]
nozero_col_read  <- df_pca[, colSums(df_pca) != 0]

pca      <- prcomp(nozero_col, scale. = TRUE, retx = TRUE)
pca_read <- prcomp(nozero_col_read, scale. = TRUE, retx = TRUE)

pdf(file = "output/PCA_Sample_source.pdf", width = 10, height = 6)
fviz_pca_ind(pca, label = "none", habillage = comparison_meta[-65, ]$Source,
             addEllipses = TRUE, ellipse.level = 0.95, ellipse.type = "t",
             geom = "text", legend.title = "Sample source") +
  labs(title = "PCA Sample source", x = "PC1 (20.7%)", y = "PC2 (9.8%)") +
  theme_bw() +
  geom_point(aes(color = comparison_meta[-65, ]$Source), size = 2)
dev.off()
