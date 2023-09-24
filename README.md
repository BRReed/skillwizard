# **SKILLWIZARD**
---




## **Table of Contents**
---
<details open>

<summary></summary>

1. [About](#about)

2. [Installation](#installation) <br>
2a. [Bash](#bash-installation) <br>
2b. [PowerShell](#powershell-installation) <br>
2c. [Python](#python-installation)

3. [Adding Modules](#adding-modules)

4. [Creating Modules](#creating-modules)

5. [Contributing Modules](#contributing-modules)

6. [Future](#future)


</details>

<br><br>


## **About**
---
SKILLWIZARD is a terminal based program to help you learn commands and shortcuts 
to your favorite systems, applications, languages, etc. through repetition.


## **Installation**
---
The following is required for all installations:

Download the `main.sh, main.ps1` or `main.py` script to a directory of your choosing (i recommend making a directory called `skillwizard`). Download the modules you are interested in trying (or make your own!) to (this part is necessary) a subdirectory called `modules` of the directory you put the `main` script into. 

### **Bash Installation**

In Bash navigate to the directory you saved `main.sh` and enter the command `bash main.sh`.

### **PowerShell Installation**

Run the command `Get-ExecutionPolicy` in Powershell. Anything other than `Unrestricted` may cause issues. There are a couple paths to getting the script to run. 
1. Permanently change your Execution Policy (least safe). Open a Powershell instance and enter `Set-ExecutionPolicy -Scope CurrentUser Unrestricted`. Note: You can change the execution policy for all users by excluding `-Scope CurrentUser` from the above command. You will need to be running Powershell as Administrator, and if anyone aside from you uses this machine I can't recommend doing this. 
2. Temporarily change your Execution Policy (medium safety). Open a powershell instance and type the following  `Set-ExecutionPolicy Bypass -Scope Process` . This will allow you to run the script without any permanent changes being made to your machine. This still carries some risk, as you are running a script from an unknown (me) source. 
3. Wild West Cowboy no other option (medium safety): If you are unable to do it the other 2 ways but your machine's Execution Policy is `RemoteSigned` you can do the following in exact order. Open `main.ps1` in Notepad. With Notepad still open, delete `main.ps1` from your machine. Go back and save `main.ps1` in Notepad to your same directory. 

In PowerShell navigate to the directory you saved `main.ps1` to and enter the command `./main.ps1`.


### **Python Installation**

You must have Python installed on your machine. 

On Windows:
Enter the command `python --version` into PowerShell. 
If you do not have Python go [here](https://learn.microsoft.com/en-us/windows/python/beginners#install-python) or enter `python` in PowerShell and Windows will open the Microsoft Store for you. 

On Mac OS and Linux Python is pre-installed.If you are on a Linux distro that doesn't have Python pre-installed you probably don't need my instruction on how to do it.


## **Adding Modules**
---
You can add any csv to your `<skillwizard Path>/modules` directory and it will 
show up as a selectable module the next time you run your program. 

## **Creating Modules**
---
Create a CSV in the same format as the ones located in the `./modules` 
directory. 

The format is as follows:
Double quote - question - double quote - comma - double quote - answer - double 
quote - new line

Example: 

`"What is the capitol of California","Sacramento"`<br>
`"What did you eat for breakfast","Cereal"`

Please be aware capitalization matters in the answer.


## **Contributing Modules**
---
1. Modules should be limited in scope (e.g. `linux directory basics` and not 
`every command in powershell`)

2. Modules should be limited to 15 question-answer pairs. In my opinion 10 is the 
sweet spot so if you have 18 question-answer pairs you would like to contribute 
please consider contributing 2 modules, one for basics and advanced, or a one of
two if it is not possible to break it up in basic and advanced questions. If you feel your module deserves an exemption please contact me directly with your case.

3. The name of the file should help to easily identify the contents. 
`vi_movement_commands.csv` is going to be accepted while `vi_commands.csv` would
 not.

 ## **Future** 

 1. Update lines in place so the welcome message doesn't scroll up and you can no longer see past answers during repeats
 2. Implement the ability to use special characters
 3. colors for posix compliant shell
 4. ~~Add License~~ ☑️
 5. Differentiate between directories and files in modules directory. only report CSV files
