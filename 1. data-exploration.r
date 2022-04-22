install.packages("tidyverse")
library(tidyverse, help, pos = 2, lib.loc = NULL)

# Question: do cars with big engines consume more fuel than cars with smaller engine ?
# To answer that question, we use "mpg" dataset.

# displ: car engine size (in liter)
# hwy: car engine efficiency on highway (more is better)
mpg

# ggplot(data = <DATA>) +
#  <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>))
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = class))

