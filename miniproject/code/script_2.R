#!/usr/bin/env Rscript

#Author: Amy Feakes
#Script: script_2.R
#Description: Fitting models to the data and analysing fits
#Date: Nov 2022

#Clear workspace
rm (list=ls())

#Dependencies 
require(tidyverse)
require(ggplot2)
require(minpack.lm)
require(dplyr)
require(ggpubr)

#import the dataset 
data <- read.csv("../results/growthdata2.csv") #read in the data
#str(data)
#order by ID
data <- arrange(data, ID)
#add title for each unique ID for plotting purposes
data$data_title = paste(data$ID, data$Species, data$Temp, data$Medium, sep="_")


#Model equations 
quadratic_model_form <- function(t, a, b, c){
  return((a*(t^2)) + (b*(t)) + c) 
}

cubic_model_form <- function(t, a, b, c, d){
  return((a*(t^3)) + (b*(t^2)) + (c*(t)) + d)
}

logistic_model <- function(t, r_max, K, N_0){ # The classic logistic equation
  return(N_0 * K * exp(r_max * t)/(K + N_0 * (exp(r_max * t) - 1)))
}

gompertz_model <- function(t, r_max, K, N_0, t_lag){ # Modified gompertz growth model (Zwietering 1990)
  return(N_0 + (K - N_0) * exp(-exp(r_max * exp(1) * (t_lag - t)/((K - N_0) * log(10)) + 1)))
}

####quadratic model ####
quadratic_model <- function (subdata) {
  tryCatch({
    quad_sucess <- 1
    quadratic_mod <- lm(subdata$PopBio ~ subdata$Time + I(subdata$Time^2))
    quad_list <- c(quadratic_mod$coefficients[[1]], quadratic_mod$coefficients[[2]], quadratic_mod$coefficients[[3]]
                   , quad_sucess, summary(quadratic_mod)$adj.r.squared)
    quad_results <- quad_list
    return(quad_results)},
    error = function(e){("There was an error")
      quad_error <-1
      quad_error_list <- c(quad_error)
      return(quad_error_list)
    })
}

####cubic model ####
cubic_model <- function (data) {
  tryCatch({
    cubic_sucess <- 1
    cubic_mod <- lm(data$PopBio ~ data$Time + I(data$Time^2) + I(data$Time^3))
    cubic_list <- c(cubic_mod$coefficients[[1]], cubic_mod$coefficients[[2]], cubic_mod$coefficients[[3]], 
                    cubic_mod$coefficients[[4]], cubic_sucess, summary(cubic_mod)$adj.r.squared)
    return(cubic_list)},
    error = function(e){("There was an error,")
      cubic_error <- 0
      cubic_error_list <- c(cubic_error)
      return(0)})
}

####Logistic model#### 
logis_model <- function (newdata=subdata) {
  tryCatch({
    logis_sucess <- 1
    lm_growth <- lm((newdata$PopBio) ~ newdata$Time)
    N_0_start <- min(newdata$PopBio) # lowest population size
    K_start <- max(newdata$PopBio) # highest population size
    #r_max_start <- summary(lm_growth)$coefficients[2,1] # use our estimate from the OLS fitting from above
    #r_max_start <- max(diff(newdata$log_PopBio))/2
    r_max_start <- 0.01
    nlc = nls.control(maxiter=500)
    logis_mod <- nlsLM(PopBio ~ logistic_model(t=Time, r_max, K, N_0), newdata,
                       list(r_max=r_max_start, N_0=N_0_start, K = K_start), control=nlc, lower = c(0,0,0))
    logis_list <- c(r_max = coef(logis_mod)["r_max"], K = coef(logis_mod)["K"], N_0 = coef(logis_mod)["N_0"]
                   , logis_sucess)
    logis_results <- logis_list
    return(logis_results)},
    error = function(e){
      print("There was an error! :(")
      logis_error <- 0
      logis_error_list <- c(NA, NA, NA, NA, logis_error)
      return(logis_error_list)})
}

####Gompertz model ####
gomp_model <- function (newdata= subdata) {
  tryCatch({
    gomp_sucess <- 1
    lm_growth <- lm((newdata$log_PopBio) ~ newdata$Time)
    N_0_start <- min(newdata$log_PopBio) # lowest population size
    K_start <- max(newdata$log_PopBio) # highest population size
    #r_max_start <- max(diff(log(newdata$PopBio)))/2
    r_max_start <- summary(lm_growth)$coefficients[2,1] # use our estimate from the OLS fitting from above
    #r_max_start <- 0.01
    t_lag_start <- newdata$Time[which.max(diff(diff(newdata$log_PopBio)))] # find last timepoint of lag phase 
    #nlc <- nls.control(maxiter = 10) #control=nlc
    gomp_mod <- nlsLM(log_PopBio ~ gompertz_model(t=Time, r_max, K, N_0, t_lag), newdata,
                      list(t_lag=t_lag_start, r_max=r_max_start, K = K_start, N_0=N_0_start))
    gomp_list <- c(t_lag = coef(gomp_mod)["t_lag"], r_max = coef(gomp_mod)["r_max"], N_0 = coef(gomp_mod)["N_0"],  
                   K = coef(gomp_mod)["K"], gomp_sucess)
    gomp_results <- gomp_list
    return(gomp_results)},
    error = function(e){("There was an error,")
      gomp_error <- 0
      gomp_error_list <- c(NA, NA, NA, NA, NA, 0)
      return(gomp_error_list)})
}


####RSS functions ####

standard_rss <- function(mod, dat){
  return(sum((mod-dat)^2))
}

log_rss <- function(mod, dat){
  return(sum((log(mod)-log(dat))^2))
}

get_quad_rss <- function(t, a, b, c){
  model_y <- quadratic_model_form(t, a, b, c)
  return(standard_rss(mod = model_y, dat=subdata$PopBio))
}

get_cub_rss <- function(t, a, b, c, d){
  model_y <- cubic_model_form(t, a, b, c, d)
  return(standard_rss(mod = model_y, dat=subdata$PopBio))
}

get_log_rss <- function(t,r_max, K, N_0){
  model_y <- logistic_model(t,r_max, K, N_0)
  return(standard_rss(mod = model_y, dat=subdata$PopBio))
}

get_gomp_rss <- function(t,r_max, K, N_0, t_lag){
  model_y <- gompertz_model(t,r_max, K, N_0, t_lag)
  return(standard_rss(mod = exp(model_y), dat=subdata$PopBio))
}

####AIC function ####

get_aicc <- function(n, p,r_ss){
  aicc_value <- n*(log(r_ss/n)) + (2*p)*(n/(n-p-1))
  return(aicc_value)
}

#Weighted AIC function

weighted_aic <- function(list_aic){
  aic_min <- min(list_aic)
  aic_delta <- list_aic - aic_min
  aic_exp <- exp((-0.5)*(aic_delta))
  weight <- aic_exp / (sum(aic_exp))
  return(weight)
}


####creating the results table####

#create df with basic info for each id
model_results = data.frame(ID=unique(data$ID), Species=NA, Temp=NA, Medium=NA,sample_size=NA)

#checking
#head(model_results)

#creating lists for plots
plots = list(length(unique(data$ID)))
#loop to put into a df 
for(id in unique(data$ID)){
  subdata <- subset(data, ID == id)
  
  ####calling base data in####
  model_results$ID[id] <- unique(subdata$ID)
  model_results$Species[id] <- unique(subdata$Species)
  model_results$Temp[id] <- unique(subdata$Temp)
  model_results$Medium[id] <- unique(subdata$Medium)
  model_results$sample_size[id] <- length(subdata$Time)
  
  ####quadratic model####
  quad_results <- quadratic_model(subdata)
  model_results$quad_parameters[id] <- 3
  model_results$quad_intercept[id] <- quad_results[[1]]
  model_results$quad_linear[id] <- quad_results[[2]]
  model_results$quad_quad[id] <- quad_results[[3]]
  model_results$quad_sucessful[id] <- quad_results[[4]]

  ####cubic model ####
  cubic_results <- cubic_model(subdata)
  model_results$cubic_parameters[id] <- 4
  model_results$cubic_intercept[id] <- cubic_results[[1]]
  model_results$cubic_linear[id]  <- cubic_results[[2]]
  model_results$cubic_quad[id]  <- cubic_results[[3]]
  model_results$cubic_cubic[id]  <- cubic_results[[4]]
  model_results$cubic_sucessful[id]  <- cubic_results[[5]]

 ####logistic model ####
  logis_results <- logis_model(subdata)
  model_results$logis_parameters[id] <- 3
  model_results$logis_r_max[id] <- logis_results[[1]]
  model_results$logis_n_0[id] <- logis_results[[3]]
  model_results$logis_k[id] <- logis_results[[2]]
  model_results$logis_sucessful[id] <- logis_results[[4]]

  ####gomp model ####
  gomp_results <- gomp_model(subdata)
  model_results$gomp_parameters[id] <- 4
  model_results$gomp_r_max[id] <- gomp_results[[2]]
  model_results$gomp_n_0[id] <- gomp_results[[3]]
  model_results$gomp_k[id] <- gomp_results[[4]]
  model_results$gomp_t_lag[id] <- gomp_results[[1]]
  model_results$gomp_sucessful[id] <- gomp_results[[5]]

  ##RSS
  model_1_rss <-get_quad_rss(subdata$Time, quad_results[3], quad_results[2], quad_results[1])
  model_2_rss <- get_cub_rss(subdata$Time, cubic_results[4],cubic_results[3],cubic_results[2],cubic_results[1])
  model_3_rss <- get_log_rss(subdata$Time, logis_results[[1]], logis_results[[2]],logis_results[[3]])
  model_4_rss <- get_gomp_rss(subdata$Time, gomp_results[[2]],gomp_results[[4]],gomp_results[[3]],gomp_results[[1]])
  
  model_results$quad_rss[id] <- model_1_rss
  model_results$cub_rss[id] <- model_2_rss
  model_results$logis_rss[id] <- model_3_rss
  model_results$gomp_rss[id] <- model_4_rss

  ##AIC 
  model_1_aicc <- get_aicc(length(subdata$PopBio), model_results$quad_parameters, model_1_rss)
  model_2_aicc <- get_aicc(length(subdata$PopBio), model_results$cubic_parameters, model_2_rss)
  model_3_aicc <- get_aicc(length(subdata$PopBio), model_results$logis_parameters, model_3_rss)
  model_4_aicc <- get_aicc(length(subdata$PopBio), model_results$gomp_parameters, model_4_rss)
  
  model_results$quad_aicc[id] <- model_1_aicc
  model_results$cub_aicc[id] <- model_2_aicc
  model_results$logis_aicc[id] <- model_3_aicc
  model_results$gomp_aicc[id] <- model_4_aicc
  
  #Calculating number of successful models in a new column
  total_success <- sum(model_results$quad_sucessful[id],model_results$cubic_sucessful[id],model_results$logis_sucessful[id],model_results$gomp_sucessful[id])
  model_results$sucessful[id] <- total_success
  
  #Weighted aic 
  all_aicc <- c(model_results$quad_aicc[id],
                model_results$cub_aicc[id],
                model_results$logis_aicc[id],
                model_results$gomp_aicc[id])
  print(all_aicc)
  
  weight_results <- weighted_aic(all_aicc)
  
  model_results$aicc_weight_1[id] <- weight_results[[1]]
  model_results$aicc_weight_2[id] <- weight_results[[2]]
  model_results$aicc_weight_3[id] <- weight_results[[3]]
  model_results$aicc_weight_4[id] <- weight_results[[4]]


  
  ##Loop for columns to state best model fit 
  if ((model_results$aicc_weight_2[id] >=0.9) & (!is.na(model_results$aicc_weight_2[id]))){
    model_results$cubic_win[id] <- 1
  } else {
    model_results$cubic_win[id] <- 0
  }
  
  if ((weight_results[[3]] >=0.9)  & (!is.na(model_results$aicc_weight_3[id]))){
    model_results$logis_win[id] <- 1
  } else {
    model_results$logis_win[id] <- 0
  }
  
  if (model_results$cubic_win[[id]] ==1){
    model_results$overall[id] <- "cubic"
  } else if (model_results$logis_win[[id]] ==1) {
    model_results$overall[id] <- "logistic"
  } else if ((model_results$cubic_win[[id]]==0) & (model_results$logis_win[[id]] ==0))
    model_results$overall[id] <- "0"
  
  #Loop to distingush models with no best fit according to Akaike weights
  if ((model_results$aicc_weight_1[id] <0.9) & (model_results$aicc_weight_2[id] <0.9) &
      (model_results$aicc_weight_3[id] <0.9) & (model_results$aicc_weight_4[id] <0.9) &
      (!is.na(model_results$aicc_weight_1[id])) &(!is.na(model_results$aicc_weight_2[id])) 
      & (!is.na(model_results$aicc_weight_4[id]))& 
      (!is.na(model_results$aicc_weight_3[id]))) {
    model_results$no_win[id] <- 1
  } else {
    model_results$no_win[id] <- 0
  }
      

  ##Plotting the models 

  timepoints <- seq(min(subdata$Time), (max(subdata$Time)), 5)
  
  quadratic_points <- quadratic_model_form(t = timepoints,
                                      a= quad_results[[3]],
                                      b= quad_results[[2]],
                                      c= quad_results[[1]])
  df1 <- data.frame(timepoints, quadratic_points)
  df1$model <- "quadratic_model"
  names(df1) <- c("Time", "PopBio", "model")
  
  cubic_points <- cubic_model_form(t = timepoints,
                                      a= cubic_results[[4]],
                                      b= cubic_results[[3]],
                                      c= cubic_results[[2]],
                                      d= cubic_results[[1]])
  
  df2 <- data.frame(timepoints, cubic_points)
  df2$model <- "cubic_model"
  names(df2) <- c("Time", "PopBio", "model")
  
  logistic_points <- (logistic_model(t = timepoints,
                                        r_max = (logis_results[[1]]),
                                        K = (logis_results[[2]]),
                                        N_0 =(logis_results[[3]])))
  df3 <- data.frame(timepoints, logistic_points)
  df3$model <- "logistic_model"
  names(df3) <- c("Time", "PopBio", "model")
  
  gompertz_points <-gompertz_model(t = timepoints,
                                         r_max = (gomp_results[[2]]),
                                         K = (gomp_results[[4]]),
                                         N_0 =(gomp_results[[3]]),
                                        t_lag=(gomp_results[[1]]))

  df4 <- data.frame(timepoints, exp(gompertz_points))
  df4$model <- "gompertz_model"
  names(df4) <- c("Time", "PopBio", "model")
 
  
  model_frame <- rbind(df1, df2, df3, df4)
  ###ggplot ####
  
  m <- ggplot(subdata, aes(x = Time, y = PopBio)) +
    geom_point(size = 1) +
    geom_smooth(data = model_frame, aes(x = Time, y = PopBio, col =model), se=F) +
    labs(x = "Time", y = "Population Density") + 
    scale_color_manual(values=c("deeppink1","darkolivegreen2","mediumturquoise","mediumpurple1"),
                       labels=c("Cubic", "Gompertz", "Logistic", "Quadratic")) +
    guides(col=guide_legend(title="Model type")) 
    #scale_fill_discrete(name="Model type", breaks=c("Cubic", "Gompertz", "Logistic", "Quadratic"))
  
  plots[[id]] <- m

} 

##END OF LOOP ##

#plotting exemplare curves 

p1 <- plots[[70]]
p2 <- plots[[149]]

fig1 <- ggarrange(p1, p2, labels = c('A', 'B'))
ggsave(fig1, filename="../results/fig1.png", height=8, width=12)

#subset for data with four successful models
correct_models <- subset(model_results, sucessful == 4)


#Distribution of models based on AICc  
mean_1 <- (100*(signif(mean(correct_models$aicc_weight_1),2))) # 0.09084 0.10394 0.0934
mean_2 <- (100*(signif(mean(correct_models$aicc_weight_2),3))) # 0.18424 0.1845 0.1600
mean_3 <- (100*(signif(mean(correct_models$aicc_weight_3),3))) # 0.69285 0.6840 0.71787
mean_4 <- (100*(signif(mean(correct_models$aicc_weight_4),2))) #0.03206 0.02744 0.02865

mean_model <- data.frame(
  value=c(mean_1, mean_2, mean_3, mean_4),
  models=c("Quadratic", "Cubic", "Logistic", "Gompertz")
)
# 

p3  <- ggplot(mean_model, aes(x="", y=value, fill=models)) +
      geom_bar(stat="identity", width=1, colour="white") +
      coord_polar("y", start=0) +
      labs(xlab="", ylab="") +
      scale_fill_discrete(name="Model type", breaks=c("Quadratic", "Cubic", "Logistic", "Gompertz")) +
      geom_text(aes(label=round(value, digits=2)),
                position= position_stack(vjust = 0.5))+
      theme_void() +
      theme(plot.title = element_text(hjust = 0.5))

#Distribution of models based on AIC weight 

win_1 <-length(which(correct_models$aicc_weight_1 >=0.9))
win_2 <-length(which(correct_models$aicc_weight_2 >=0.9))
win_3 <-length(which(correct_models$aicc_weight_3 >=0.9))
win_4 <-length(which(correct_models$aicc_weight_4 >=0.9))

aw_model <- data.frame(
  value=c(((win_1/188)*100),((win_2/188)*100),((win_3/188)*100),((win_4/188)*100)),
models=c("Quadratic", "Cubic", "Logistic", "Gompertz")
)

p4  <-ggplot(aw_model, aes(x="", y=value, fill=models)) +
  geom_bar(stat="identity", width=1, colour="white") +
  coord_polar("y", start=0) +
  labs(xlab="", ylab="")+
  scale_fill_discrete(name="Model type", breaks=c("Quadratic", "Cubic", "Logistic", "Gompertz")) +
  geom_text(aes(label=round(value, digits=2)),
            position= position_stack(vjust = 0.5))+
  theme_void() + 
  theme(plot.title = element_text(hjust = 0.5))



fig2 <- ggarrange(p3, p4, labels = c('A', 'B'))
ggsave(fig2, filename="../results/fig2.png", height=8, width=12)


##looking at medium 
#Chi-square test
#summary(table(correct_models$overall, correct_models$Medium))


#subset to plot medium by model
medium_plot <- subset(correct_models, correct_models$overall != 0)

#plotting medium by model 
p5 <- ggplot(medium_plot, aes(x=Medium, fill=overall)) +
  geom_bar(position="stack") + 
  xlab("Type of medium")+
  ylab("Count")+
  scale_fill_discrete(name = "Model Type", labels = c("Cubic", "Logistic"))+
  theme(axis.text.x = element_text(angle = 45, hjust=1))
  
p5


ggsave(p5, filename="../results/fig3.png", height=8, width=8)

#Chi-squaretest
#summary(table(correct_models$no_win, correct_models$Medium))

