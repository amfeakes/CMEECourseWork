#Author: Amy Feakes
#Script: next.R
#Description: using next to skip to the next iteration in a loop 
#Date: Oct 2022

#using next
#skips to the next iteration of a loop 
for (i in 1:10) {
  if((i %% 2) == 0) #check if the number is odd
    next #pass to the next iteration of loop
  print(i)
}
#code checks if number is odd using modulo operation 
#then prints it if is odd 
