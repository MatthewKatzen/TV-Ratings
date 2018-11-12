library(ggplot2)
library(readxl)
library(reshape2)

#absolute
data <- readxl::read_xlsx('data.xlsx')
colnames(data)[1] <- 'year'
long <- melt(data, 'year')
ggplot(long, aes(x = year, y = value, colour = variable)) +
    geom_line()


#Absolute change
change <- tail(data, -1) - head(data, -1)
change$year <- 2010:2018
long.change <- melt(change, 'year')
ggplot(long.change, aes(x = year, y = value, colour = variable)) +
    geom_line()
