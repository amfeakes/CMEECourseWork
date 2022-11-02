#Author: Amy Feakes
#Script: PP_Dists.R
#Description: draws three subplots of an ecological dataset and calculates means and medians 
#Date: Oct 2022

require(ggplot2)
require(tidyverse)
#Draw and saves three figures - containing subplots of distribtuions 
#of predator mass, prey mass and size ratio of prey mass/predator mass - 
#by feeding interaction type
#use logs of masses for all three plots 
#script should calculate log mean and median of predator pass, pret mass and ratio into csv
#outputs - Pred_Subplots.pdf,Prey_Subplots.pdf, SizeRatio_Subplots.pdf, PP_Results.csv

#### ####
#input df
df <- read.csv("../data/EcolArchives-E089-51-D1.csv")
#check size and description 
dim(df)
str(df) #note units mg and g in prey mass - this will need to be converted
View(df)
#type of feeding interactions list - to help with plot code
levels(df$Type.of.feeding.interaction)

#[1] "insectivorous"          "piscivorous"           
#[3] "planktivorous"          "predacious"            
#[5] "predacious/piscivorous"


theme_update(plot.title = element_text(hjust = 0.5))

####converting all prey mass to g ####

#using mutate and case_when to create a new column for prey mass where all units are g 
df <- df %>%
  mutate(Prey.merge=case_when(
    Prey.mass.unit == "g" ~ Prey.mass,
    Prey.mass.unit == "mg" ~ Prey.mass/1000,
  ))
#check
head(df)

#### converting subset names to presentation ready level ####
# Make a modified copy of the original data
df_mod <- df %>%
  # Rename subsets
  mutate(df = recode(df$Type.of.feeding.interaction,
                  "insectivorous" = "Insectivourous","piscivorous" = "Piscivorous",
                  "planktivorous" ="Planktivorous","predacious"="Predacious",
                  "predacious/piscivorous"= "Predacious/Piscivorous"))

df$Type.of.feeding.interaction <- factor(df$Type.of.feeding.interaction, levels = c("insectivorous","piscivorous",
                                      "planktivorous","predacious",
                                      "predacious/piscivorous"),
                  labels = c( "Insectivourous","Piscivorous",
                             "Planktivorous","Predacious",
                               "Predacious/Piscivorous"))
#### pred subplots ####

#create a gg plot
#facet grid plots each of the feeding interactions in different density graphs in the same format and dims
#the printed onto a pdf
#same structure for each subplot set 
pred_all <- ggplot(df, aes(x=log(Predator.mass),
                fill=Type.of.feeding.interaction)) + 
                geom_density() + 
                labs(title="The distribution of predator mass subset by type of feeding interaction"
                      , y="Density", x="log (Predator mass)") +
                facet_grid( Type.of.feeding.interaction ~ .) +
                theme(legend.position="none") +
                theme(panel.spacing.y = unit(2, "lines")) +
                theme(strip.text.y = element_text(size = 11))
                  
pred_all
dev.off()

pdf(paper = "a4", width = 0, height = 0,"../results/Pred_Subplots.pdf")
print(pred_all)
dev.off()

####prey subplots ####

prey_all <- ggplot(df, aes(x=log(Prey.merge),
                           fill=Type.of.feeding.interaction)) + 
  geom_density() + 
  labs(title="The distribution of prey mass subset by type of feeding interaction"
       , y="Density", x="log (Prey mass)") +
  facet_grid( Type.of.feeding.interaction ~.) +
  theme(legend.position="none") +
  theme(panel.spacing.y = unit(2, "lines")) +
  theme(strip.text.y = element_text(size = 11))

prey_all

pdf(paper = "a4", width = 0, height = 0,"../results/Prey_Subplots.pdf")
print(prey_all)
dev.off()

#### ratio  #### 
#prey mass/predator mass 
#added calculation in the x axis 
ratio <- ggplot(df, aes(x=(log(Prey.merge/Predator.mass)),
                           fill=Type.of.feeding.interaction)) + 
  geom_density() + 
  labs(title="The distribution of the ration of prey over predator mass, subset by type of feeding interaction"
       , y="Density", x="log (Prey mass/Predator mass)") +
  facet_grid( Type.of.feeding.interaction ~.) +
  theme(legend.position="none") +
  theme(panel.spacing.y = unit(2, "lines")) +
  theme(strip.text.y = element_text(size = 11))
ratio

pdf(paper = "a4", width = 0, height = 0,"../results/SizeRatio_Subplots.pdf")
print(ratio)
dev.off()

####means and meadians####

#create new colum for size ratio 
df <- transform(df,Size.ratio =(log(df$Prey.merge/df$Predator.mass)))
#check
#head(df)
#View(df)

#create a new space
#group_by converts a df into a tibble in the suggested format 
#summarise groups variables to calcualte mean and medain 
#use signif to 3 to match what the data is provided as 
#write to a csv
pp_results <- df%>% 
  group_by(Type.of.feeding.interaction) %>%
  summarise(Mean_prey_mass = signif(mean(Prey.merge),3), Mean_predator_mass = signif(mean(Predator.mass), 3),
            Mean_size_ratio = signif(mean(Size.ratio),3), Median_prey_mass = signif(median(Prey.merge),3),
            Median_predator_mass = signif(median(Predator.mass),3), Median_size_ratio = signif(median(Size.ratio),3))



write.csv(pp_results , file = "../results/PP_Results.csv")





