#!/bin/bash
 
 
 
 
welcome_message() {
 
cat <<EOF
 
  ____,__, ,__, __,  __,    _   _,__, ___,  ____,____, ____, 
 (-(__(-|_/(-| (-|  (-|    (-|  |(-| (- /  (-/_|(-|__)(-|  \ 
 ,____)_| \,_|_,_|__,_|__,  _|/\|,_|_,_/__,_/  |,_|  \,_|__/ 
                       LEARN BY ROTE IN THE TERMINAL
 
 
 
 
EOF
 
}
 
 
print_available_modules() {
 
    local i=0
    for key in "${!modules[@]}"; do echo "$i - ${modules[$i]}"; i=$((i+1)); done
}
 
get_modules() {
 
    search_dir=./modules
    local i=0
    for m in "$search_dir/"*
    do
        modules+=( [$i]=$m )
        i=$((i+1))
    done
}
 
get_module_values() {
 
    while IFS="," read -r question answer; do QAMap+=( [$question]=$answer );
    done < modules/test.csv
 
}
 
 
 
main() {
 
    welcome_message
    declare -A modules
    declare -A QAMap
    get_modules
    print_available_modules
 
    for key in "${!QAMap[@]}"; do echo "${key} - ${QAMap[$key]}"; done
    echo 'Type the number of the module you would like to practice'
    read requested_module
    get_module_values
    echo -e "\e2A\e[0K two"
    echo -e "\e1A\e[0K one"
    echo -e "\e3A\e[0K three"
    echo -e "\e4A\e[0K four"
}
 
main