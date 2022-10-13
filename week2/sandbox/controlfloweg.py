if <expr>:
    <statement>

x = 0 ; y = 2

if x < y :
    print('yes') #prints yes as 0 is less than 2 
if x: 
    print('yes') # no output, x is an integer ie if x=1 output would be yes  WHY
if x==0:
    print('yes') #prints yes - as x does equal 1 
if y: 
    print('yes') #prints yes - as there is a value assigned to y 
if y == 2:
    print('yes') #prints yes - as y does equal 2 

x = True #makes x boolean

if x: 
    print('yes') #prints yes

if x == True:
    print('yes') #prints yes 