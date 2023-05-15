#!/bin/bash
 
 
 
 
welcome_message() {
 
cat <<EOF
 
  ____,__, ,__, __,  __,    _   _,__, ___,  ____,____, ____, 
 (-(__(-|_/(-| (-|  (-|    (-|  |(-| (- /  (-/_|(-|__)(-|  \ 
 ,____)_| \,_|_,_|__,_|__,  _|/\|,_|_,_/__,_/  |,_|  \,_|__/ 
                       LEARN BY ROTE IN THE TERMINAL
 
 
 
 
EOF
 
}
 
 
main() {
    welcome_message
    declare -A modules
    declare -A module_dict
}



main