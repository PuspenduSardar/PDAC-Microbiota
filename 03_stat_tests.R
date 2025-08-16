############################################
# t-tests & Wilcoxon rank-sum tests
############################################
source("01_load_packages.R")

# T-test
t.result <- t(sapply(PDAC_Bile_stent_status[-1], function(x) {
  tt <- t.test(x ~ PDAC_Bile_stent_status$Status)
  unlist(tt[c("estimate", "p.value", "statistic", "conf.int")])
}))
t.result <- as.data.frame(t.result)
write.table(t.result, file = "output/PDAC_bile_ttest_results.txt", sep = "\t", quote = FALSE, dec = ".", row.names = TRUE)

# Wilcoxon test
will_test <- data.frame(
  stats_w = apply(subset(PDAC_Bile_stent_status, select = -Status), 2,
                  function(y) wilcox.test(y ~ PDAC_Bile_stent_status$Status, exact = FALSE)$statistic),
  p_w     = apply(subset(PDAC_Bile_stent_status, select = -Status), 2,
                  function(y) wilcox.test(y ~ PDAC_Bile_stent_status$Status, exact = FALSE)$p.value)
)
will_df <- as.data.frame(will_test)
will_df$BH_padj <- p.adjust(will_df$p_w, method = "BH")
write.table(will_df, file = "output/PDAC_bile_wilcoxon_results.txt", sep = "\t", quote = FALSE, dec = ".", row.names = TRUE)
