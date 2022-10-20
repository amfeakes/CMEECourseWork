def modify_list_1(some_list):
    print('got', some_list)
    some_list = [1, 2, 3, 4]
    print('set to', some_list)

my_list = [1, 2, 3]

print('before, my_list=', my_list)

modify_list_1(my_list)

print('after, my_list =', my_list)
###the return function means that the origingal my list is explicity changed - ie now the 4 is in the original list
def modify_list_2(some_list):
    print('got', some_list)
    some_list = [1, 2, 3, 4]
    print('set to', some_list)
    return some_list

my_list = modify_list_2(my_list)

print('after, my_list =', my_list)

###this now is to modify it back to the original list, using append
def modify_list_3(some_list):
    print('got', some_list)
    some_list.append(4) #this is the modiication to the list
    print('changed to', some_list)
my_list = [1, 2, 3]
print('before, my_list =', my_list)

modify_list_3(my_list)

print('after, my_list', my_list)