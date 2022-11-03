#!/usr/bin/env Rscript

#Author: Amy Feakes
#Script: MyBars.R
#Description: using ggplot geom to annontate a plot 
#Date: Oct 2022

#Clear workspace
rm(list=ls())

#Dependencies
require(tidyverse)

#load data
a<-read.table("../data/Results.txt", header=TRUE)

#check data 
head(a)

#new column of zeros
a$ymin <- rep(0, dim(a)[1]) 

# print the first line range
p <- ggplot(a)
p <- p + geom_linerange(data = a, aes(
  x = x,
  ymin = ymin,
  ymax = y1,
  size = (0.5)
),
colour = "#E69F00",
alpha = 1/2, show.legend = FALSE)

# print the second line range
p <- p + geom_linerange(data = a, aes(
  x = x,
  ymin = ymin,
  ymax = y2,
  size = (0.5)
),
colour = "#56B4E9",
alpha = 1/2, show.legend = FALSE)

# print the third linerange:
p <- p + geom_linerange(data = a, aes(
  x = x,
  ymin = ymin,
  ymax = y3,
  size = (0.5)
),
colour = "#D55E00",
alpha = 1/2, show.legend = FALSE)

# annotate the plot with labels:
p <- p + geom_text(data = a, aes(x = x, y = -500, label = Label))

# axis labels, remove the legend and bw
p <- p + scale_x_continuous("My x axis",
                            breaks = seq(3, 5, by = 0.05)) + 
  scale_y_continuous("My y axis") + 
  theme_bw() + 
  theme(legend.position = "none") 
p

#printing into a pdf

pdf(paper = "a4r", width = 0, height = 0,"../results/MyBars.pdf")
print(p)
dev.off()