def buggyfunc(x):
    y = x
    for i in range(x):
        y = y-1
      #  import pdb; pdb.set_trace() ##this is a breakpoint
        z = x/y
        except ZeroDivisionError:
            print(f"The result of dividing a number by zero is undefined")
        except:
            print(f"This didn't work;{x = }; {y = }")
        else:
            print(f"OK; {x = }; {y = }, {z = };")
    return z

buggyfunc(20)