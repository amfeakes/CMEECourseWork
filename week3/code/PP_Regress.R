#!/usr/bin/env Rscript

#Author: Amy Feakes
#Script: PP_Regress.R
#Description: 
#Date: Oct 2022

#Clear workspace
rm(list=ls())

#Dependencies 
require(ggplot2)
require(tidyverse)
require(dplyr)
require(plyr)
#### importing data ####
df <- read.csv("../data/EcolArchives-E089-51-D1.csv")
str(df)

#make factors 

df$Type.of.feeding.interaction <- factor(df$Type.of.feeding.interaction)
df$Predator.lifestage <- factor(df$Predator.lifestage)
df$Predator.mass <- as.numeric(df$Predator.mass)
str(df)

####converting all prey mass to g ####
#using mutate and case_when to create a new column for prey mass where all units are g 
df <- df %>%
  mutate(Prey.merge=case_when(
    Prey.mass.unit == "g" ~ Prey.mass,
    Prey.mass.unit == "mg" ~ Prey.mass/1000,
  ))
#check
#head(df)

#### creating the plot ####
#geom_point creates the scatter plot
#geom_smooth adds likes with error margins 
#aspect ratio creates the margins in the plots
#scale is logged and labels are added in a scientific format

regress_plot <- ggplot(df, aes(x=Prey.merge, y=Predator.mass, colour=Predator.lifestage)) + 
  geom_point(shape=3) +
  geom_smooth(method="lm", fullrange=TRUE, size=0.6) +
  facet_grid(rows= vars(Type.of.feeding.interaction)) +
  theme_bw() +
  theme(aspect.ratio=0.5,legend.position="bottom", legend.title = element_text(face="bold")) +
  guides(color= guide_legend(nrow=1)) +
  scale_x_log10("Prey Mass in grams", labels = scales::scientific) +
  scale_y_log10("Predator Mass in grams", labels = scales::scientific)

#### saving plot ####
          
pdf(paper = "a4", width = 0, height = 0,"../results/PP_Regress_plot.pdf")
print(regress_plot)
dev.off()

#### creating corresponding results ####

#output df generated, and lm inside each section to get intercept,slop rsq and p values 
#ddply - this takes the subset of a data frame,applies a function then combines the results into a new df
#the summarise command is used to take what is wanted into the df 
#the [] refer to which value in the summary table is transferred into the df 
pp_results <- ddply(df, .(Type.of.feeding.interaction, Predator.lifestage),
                    summarise,
                    Slope = summary(lm(Predator.mass~Prey.merge))$coefficients[2],
                    Intercept=summary(lm(Predator.mass~Prey.merge))$coefficients[1],
                    Rsquared=summary(lm(Predator.mass~Prey.merge))$adj.r.squared,
                    #Fstatistic=summary(lm(Predator.mass~Prey.merge))$fstatistic,
                    Pvalue=summary(lm(Predator.mass~Prey.merge))$coefficients[8]
)

head(pp_results)

#F statistic is two variables, must be done separatelty
#dlply applies a function to each subset in the df, like above
#the results are returned in a different format, this is require for F stat

lm <- dlply(df, .(Type.of.feeding.interaction, Predator.lifestage), 
            function(x) lm(Predator.mass ~ Prey.merge, data=x))

fstat <- ldply(lm, function(x) summary(x)$fstatistic[1])

#merge the df with fstat
all_results <- merge(pp_results, fstat, by=c('Type.of.feeding.interaction', "Predator.lifestage"))
#change title of Fstat column
names(all_results)[7] <- "Fstatistic"

#### saving results ####
write.csv(all_results , file = "../results/PP_Results.csv")



