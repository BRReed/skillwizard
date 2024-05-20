from csv import reader
from os import listdir
from pathlib import Path
from random import choice as rChoice


def welcome_message():
    print("""
  ____,__, ,__, __,  __,    _   _,__, ___,  ____,____, ____, 
 (-(__(-|_/(-| (-|  (-|    (-|  |(-| (- /  (-/_|(-|__)(-|  \ 
 ,____)_| \,_|_,_|__,_|__,  _|/\|,_|_,_/__,_/  |,_|  \,_|__/ 
                       LEARN BY ROTE IN THE TERMINAL
    
    """
    )

def get_input():
    """ Takes input from end user
        Returns: [str]
    """
    i = input(">")
    return i

def process_string_for_exit(i):
    """ Checks a string for exit commands
        Args: i[str]
    """
    if i in ["-1"]:
        exit()

def is_file(file):
    """ Checks if path is file. True if is file, else False
        Args: file[str]
        Returns: [bool]
    """
    path_to_file = Path(f"./modules/{file}")
    print({path_to_file})
    print(path_to_file.is_file())
    return path_to_file.is_file()

def get_module_csv_list():
    """ Gets list of files and dirs in modules subdir - non-discerning
        Returns: [arr] file names in modules subdir. 
    """
    return [file for file in listdir("./modules") if is_file(file)]

def get_selected_csv_filenames_list(modules_list, index_list):
    """ Gets user selected files
        Args: modules_list[arr][str], index_list[arr][str/int]
        Returns: [arr][1] valid selections, [arr][2] invalid selections 
    """
    filenames_list = []
    invalid_list = []
    for i in index_list:
        i = int(i)
        if i >= 0 and i < len(modules_list):
            filenames_list.append('./modules/' + modules_list[i])
        else:
            invalid_list.append(i)
    return filenames_list, invalid_list

def get_csv_info(filename):
    """ Get question-answer combinations from file
        Args: filename[str]
        Returns: [arr] Question and Answer combinations
    """
    qa_list = []
    with open(filename, newline='') as f:
        r = reader(f, delimiter=',')
        for qa in r:
            qa_list.append(qa)
    return qa_list

def print_available_modules(module_list):
    """ Prints all items in array, numbered
        Args: module_list[arr]
    """
    for i, module in enumerate(module_list):
        print(i, ". ", module)

def make_input_list(s):
    """ Takes input string, separates by space and makes list
        Args: s[str]
        Returns: [arr] of s separated by white space "1 24 3" returns [1,24,3]
    """
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

def make_module_dict(modules_list):
    """Makes hashmap of question:answer combos
       Args: modules_list[arr]
       Returns: [hmap] of question:answer combinations
    """
    d = {}
    for module in modules_list:
        qa_list = get_csv_info(module)
        for qa in qa_list:
            question = qa[0]
            answer = qa[1]
            d[question] = answer
    return d

def qa_loop(module_dict, user_input='0'):
    """ Main game loop 
    """
    while True:
        cur_key = rChoice(list(module_dict.keys()))
        print(cur_key)
        user_input = get_input()
        process_string_for_exit(user_input)
        if user_input == module_dict[cur_key]:
            answer = user_input
            answer = '\033[0;32m' + answer + '\033[0m'
        else:
            answer = wrong_answer_check(user_input, module_dict[cur_key])
        print(answer)

def wrong_answer_check(answer_given, answer_expected):
    """ Takes user answer and compares to expected answer 
        Args: answer_given[str], answer_expected[str]
        Returns: [str] answer given and answer expected 
    """
    formatted_answer = ''
    for i, char in enumerate(answer_given):
        if i >= len(answer_expected) or char != answer_expected[i]:
            if char.isspace():
                formatted_answer += '\033[41m' + char + '\033[0m'
            else:
                formatted_answer += '\033[0;31m' + char + '\033[0m'
        elif char == answer_expected[i]:
            formatted_answer += '\033[0;32m' + char + '\033[0m'
    return formatted_answer + " " + answer_expected

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
            print("Enter '-1' at any time to exit")
            continue
        break
    filenames_list, invalid_list = get_selected_csv_filenames_list(
        module_names, selected_modules_list)
    if invalid_list:
        print(invalid_list, " were invalid module numbers and were not added")
    module_dict = make_module_dict(filenames_list)
    qa_loop(module_dict)

main()