############################################
# Boxplots with ggstatsplot
############################################
source("01_load_packages.R")

pdf(file = "output/bile_source_boxplot.pdf", width = 6.4, height = 4)
plt <- ggbetweenstats(
  data = bile_samples_boxplots,
  x = Type,
  y = Abundance,
  type = "nonparametric",
  p.adjust.method = "fdr",
  pairwise.display = "all"
) +
  scale_color_manual(values = c("blue", "forestgreen", "red"))

plt_mod2 <- plt +
  labs(x = "Tumour type", y = "Relative abundance") +
  theme(axis.text = element_text(size = 8), axis.title = element_text(size = 10))
print(plt_mod2)
dev.off()
