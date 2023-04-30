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
    pass

def get_qa_list():
    return {}

def get_module_csv_list():
    "Returns list of file names from modules subdir"
    return [file for file in listdir("./modules")]

def main():
    welcome_message()
    module_names = get_module_csv_list()
    if not module_names:
        print("Unable to locate modules.")
        exit()
    print("Please enter the module numbers you want to practice separated by a space.")
    for i, module in enumerate(module_names):
        print(i, ". ", module)




main()





