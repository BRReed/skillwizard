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
2c. [Docker](#docker-installation)

3. [Adding Modules](#adding-modules)

4. [Creating Modules](#creating-modules)

5. [Contributing Modules](#contributing-modules)


</details>

<br><br>


## **About**
---
SKILLWIZARD is a terminal based program to help you learn commands and shortcuts 
to your favorite systems, applications, languages, etc. through repetition.


## **Installation**
---
Installation notes

### **Bash Installation**
TBA

### **PowerShell Installation**
TBA

### **Docker Installation**
TBA

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
 of two if it is not possible to break it up in basic and advanced questions.

3. The name of the file should help to easily identify the contents. 
`vi_movement_commands.csv` is going to be accepted while `vi_commands.csv` would
 not.
