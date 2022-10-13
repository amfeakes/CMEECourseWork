##script to transform examples 

echo "Remove    excess    spaces." | tr -s " "
### removes the excess spaces - the -s squeeze function 
echo "remove all the a's" | tr -d "a" 
### removes the ll in the all's 
echo "set to uppercase" | tr [:lower:] [:upper:]
### sets to uppercase 
echo "10.00 only numbers 1.33" | tr -d [:alpha:] | tr -s " " ","
## gets rid of letters 
