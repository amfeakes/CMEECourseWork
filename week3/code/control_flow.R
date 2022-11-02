#Author: Amy Feakes
#Script: control_flow.R
#Description: if statements, for loops, while loops 
#Date: Oct 2022

####if statements ####
# if (a) instead of if (a==TRUE) will give the same result 
a <- TRUE 
if (a == TRUE) {
  print ("a is TRUE")
} else {
  print ("a is FALSE")
}
#on a single line 
z <- runif(1) ##Generate a uniformly distrubtued random number 
if (z<=0.5) {print("less than a half")}

####for loops####
#loops are good for repeated tasks over a range of input values 
#j is a tempoary variable that stores the value of the number in the iteration
for(i in 1:10){
  j <- i * i
  print(paste(i," squared is", j))
}
#loop over a vector of strings
for(species in c('Heliodoxa rubinoides', 
                 'Boissonneaua jardini',
                 'Sula nebouxii')){
  print(paste('The species is', species))
}
#for loop using a pre exisiting vecotr 
v1 <-c("a", "bc", "def")
for (i in v1){
  print(i)
}

####while loops ####
#performing a operation until a condition is met 
i <- 0 
while(i<10) {
  i <- i+1
  print(i^2)
}

