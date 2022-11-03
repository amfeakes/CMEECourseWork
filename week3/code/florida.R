#!/usr/bin/env Rscript

#Author: Amy Feakes
#Script: florida.R
#Description: calculating correlation coefficients to understand if florida is warming
#Date: Oct 2022

#Clear workspace
rm(list=ls())

#Dependencies 
require(ggplot2)
require(cowplot)

###Is Florida getting warmer?###
###AIMS####
#you need to calculate the correlation coefficients between temperature and time
#you will use a permutation analysis instead, by generating a distribution of random correlation coefficients 
#and compare your observed coefficient with this random distribution
#Compute the appropriate correlation coefficient between years and Temperature and store it (look at the help file for cor()
#Repeat this calculation a sufficient number of times, each time randomly reshuffling the temperatures
  #(i.e., randomly re-assigning temperatures to years), and recalculating the correlation coefficient (and storing it)
#Calculate what fraction of the random correlation coefficients were greater than the observed one 
#(this is your approximate, asymptotic p-value).
#Interpret and present the results: Present your results and their interpretation in a pdf document written in 
  #latex (include the the document’s source code in the submission) (Keep the writeup, including any figures, to one A4 page).
#### #####

rm(list=ls())

load("../data/KeyWestAnnualMeanTemperature.RData")

ls()

class(ats)
head(ats)
plot(ats)

#Compute the appropriate correlation coefficient between years and temperature and store it 
#use a new variable name to store it 
#using cor() to create the coefficient 
#chosen to use kendall over spearman - as spearman is more sensitive to error and discrepancies
  #and kentall has a smaller gross error sensitivty and smaller asympototic variance 

flocor <- cor(ats$Year, ats$Temp, method="pearson")
flocor

#Repeat this calculation a sufficient number of times, each time randomly reshuffling the temperatures
#will create a loop and randomly perumtate using sample(), the create the new cov, 
#then create a vector to store the coefficient

allcor= c()
for (i in 1:1000){
  tempper <- sample(ats$Temp)
  newcor <- cor(ats$Year, tempper, method="pearson")
  allcor<- c(allcor,newcor)
}

#check values 
head(allcor)
hist(allcor)

#convert to df for plotting
dfall <- data.frame(allcor)
str(dfall)

#Then calculate what fraction of the correlation coefficients 
#from the all cov were greater than that from florcor (this is your approximate p-value).

pvalue <- (sum(allcor>flocor)/length(allcor))
pvalue


#Plotting temp and year 

#ggplot theme update
theme_update(plot.title = element_text(hjust = 0.5))
#the plot, scale fill to create gradient, removing legend
plott_y<- ggplot(ats, aes(x=Year, y=Temp, colour=Temp)) +
  geom_point() +
  labs(x="Year", y="Annual temperature") + 
  ggtitle("Annual temperature in Key West, Florida, 1901 - 2001")+
  scale_fill_brewer() +
  theme(legend.position="none")

plott_y


#Plotting random corlarion 
#geom_density (similar to hist), creating x limits for the plot 
plot_cor <- ggplot(dfall, aes(x=allcor)) +
  geom_density(colour="darkblue", fill="lightblue") +
  labs(x="Correlation Coefficient", y="Frequency") +
  ggtitle("Distribution of random correlation coefficients") +
  xlim(-0.5,0.5)

plot_cor

#create a grid with both plots

plots <- plot_grid(plott_y, plot_cor, nrow=1, labels = c("A", "B"))

#print as pdf 
pdf(paper = "a4r", width = 0, height = 0,"../results/floridaplots.pdf")
print(plots)
graphics.off()







