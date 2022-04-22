install.packages("caret")

library(readr)
library(caret)

advertising_df <- read_csv("data/advertising.csv")

head(advertising_df)

# TV Radio Newspaper Sales 
# Response : Sales
# Predictors : TV, Radio, Newspaper

# scatter plot
# pch = 20 => bullet points
# cex = 1.5 => symbol expansion relative to default value
plot(Sales~TV, data = advertising_df, col = "dodgerblue", pch = 20, cex = 1.5, main = "Sales vs Television advertising")

# pairs function is a useful to quickly visualize a number of scatter plots
pairs(advertising_df)

# However we often only wants to check the relationship between response and predictors
# featurePlot comes from the caret package
featurePlot(x = advertising_df[, c("TV", "Radio", "Newspaper")], y = advertising_df$Sales)

# There is an increase in sales as Radio and TV increases. 
# Link between sales and Newspaper is less clear.
# There seems to have relationship between TV and Radio but we need to modelise data to investigate further.

lm_0 <- lm(Sales ~ TV + Radio, data = advertising_df)

# We fit a linear model between Sales and remaining variables (predictors variables)
lm_1 <- lm(Sales ~ ., data = advertising_df)

summary(lm_1)

# anova function is useful to compare 2 models
# here, we are testing for the significance of the Newspaper variable in the additive model
anova(lm_0, lm_1)