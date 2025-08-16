############################################
# Venn diagrams
############################################
source("01_load_packages.R")

grid.newpage()
draw.quad.venn(
  area1 = 273, area2 = 370, area3 = 11, area4 = 142,
  n12 = 208, n13 = 10, n14 = 98, n23 = 10, n24 = 135, n34 = 10,
  n123 = 10, n124 = 96, n134 = 10, n234 = 10, n1234 = 10,
  category = c("PDAC Tissue", "PDAC Bile", "Benign Tissue", "Benign Bile"),
  col = c("blue", "red", "yellow", "cyan"),
  fill = c("blue", "red", "yellow", "cyan")
)
