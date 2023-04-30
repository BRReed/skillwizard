import csv
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

def get_csv_list():
    # temporary test func until get mysql up
    csv_dict = {}
    with open('./modules/linux_CLI_basics.csv', newline='') as file:
        data = csv.reader(file, delimiter=',', quotechar='|')
        for row in data:
            csv_dict[row[0]] = row[1]
    return csv_dict

def main():
    welcome_message()
    qa_dict= get_csv_list() # remove once mysql up
    #qa_dict = get_qa_list() #uncomment once mysql up
    temp_qa_list = []
    for key, i in enumerate(qa_dict):
       print(i , " " , key)
       temp_qa_list.append(key)
    if not qa_dict:
        print("Unable to connect to mysql server")
        exit()
    print("Which module would you like? Add multiple with space between module numbers")
    total_questions = len(qa_dict)


main()





