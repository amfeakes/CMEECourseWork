#!/usr/bin/env Rscript

#Author: Amy Feakes
#Script: plotLin.R
#Description: annonates a linear regression and saves the figure as pdf
#Date: Oct 2022

#Clear workspace
rm(list=ls())

#Dependencies
require(tidyverse)

#create data 
x <- seq(0,100, by=0.1)
y <- -4. +0.25 *x +
  rnorm(length(x), mean = 0., sd=2.5)

#put into a df 
mydf <- data.frame(x=x, y=y)

#linear regression 
mylm <- summary(lm(y~x, data=mydf))

#plot 
p <- ggplot(mydf, aes(x=x, y=y, 
                      colour = abs(mylm$residual))
            ) + 
  geom_point() +
  scale_colour_gradient(low="black", high="red") +
  theme(legend.position="none") +
  scale_x_continuous(
    expression(alpha^2 * pi / beta *sqrt(Theta)))

#add regression line 
p <- p + geom_abline(
  intercept = mylm$coefficients[1][1],
  slope = mylm$coefficients[2][1],
  colour="red")

p <- p +geom_text(aes(x=60, y=0,
                      label = "sqrt(alpha) * 2* pi"),
                  parse =TRUE, size=6,
                  colour="blue")


#add to pdf 

pdf(paper = "a4r", width = 0, height = 0,"../results/MyLinReg.pdf")
print(p)
dev.off()
