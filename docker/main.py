import csv
from os import listdir
from random import randrange

def welcome_message():
    print("""
  ____,__, ,__, __,  __,    _   _,__, ___,  ____,____, ____, 
 (-(__(-|_/(-| (-|  (-|    (-|  |(-| (- /  (-/_|(-|__)(-|  \ 
 ,____)_| \,_|_,_|__,_|__,  _|/\|,_|_,_/__,_/  |,_|  \,_|__/ 
                       LEARN BY ROTE IN THE TERMINAL
    
    """
    )

def get_input():
    i = input(">")
    if i == "-1":
        exit()
    return i

def get_qa_list():
    return {}

def get_module_csv_list():
    "Returns list of file names from modules subdir"
    return [file for file in listdir("./modules")]

def print_available_modules(module_list):
    for i, module in enumerate(module_list):
        print(i, ". ", module)

def make_input_list(s):
    l = []
    cur = ""
    for c in s:
        if not c.isnumeric() and not c.isspace():
            print("Invalid entry " + c + ", please try again.")
            return
        if c.isnumeric():
            cur += c
        elif c.isspace() and cur:
            l.append(cur)
            cur = ""
    if cur:
        l.append(cur)
    return l
    

def main():
    welcome_message()
    module_names = get_module_csv_list()
    if not module_names:
        print("Unable to locate modules.")
        exit()
    while True:
        print("Please enter the module numbers you want to practice separated by a space.")
        print_available_modules(module_names)
        user_modules = get_input()
        selected_modules_list = make_input_list(user_modules)
        if not selected_modules_list:
            print("Enter '-1' to exit")
            continue
        break
    print(selected_modules_list)
    # create module dict, start while loop for program
    




main()





