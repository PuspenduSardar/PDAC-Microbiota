############################################
# Example t-test
############################################
source("01_load_packages.R")

format_df <- melt(test_weight)
control_group   <- format_df$value[format_df$Tretment == "Control"]
treatment_group <- format_df$value[format_df$Tretment == "Treated"]

t_test_result <- t.test(control_group, treatment_group)
print(t_test_result)
