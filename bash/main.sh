#!/bin/bash
 
 
 
 
welcome_message() {
 
cat <<EOF
 
  ____,__, ,__, __,  __,    _   _,__, ___,  ____,____, ____, 
 (-(__(-|_/(-| (-|  (-|    (-|  |(-| (- /  (-/_|(-|__)(-|  \ 
 ,____)_| \,_|_,_|__,_|__,  _|/\|,_|_,_/__,_/  |,_|  \,_|__/ 
                       LEARN BY ROTE IN THE TERMINAL
 
 
 
 
EOF
 
}

get_modules() {
  search_dir=./modules
  if [ ! -d "$search_dir" ]
  then
    echo "Unable to locate module directory"
    exit
  fi
  if  find $search_dir -maxdepth 0 -empty | read v
  then
    echo "Unable to locate modules"
    exit
  fi
  local i=0
  for m in "$search_dir/"*
  do
    modules+=( [$i]=$m )
    i=$((i+1))
  done
}

print_available_modules() {
  local i=0
  for key in "${!modules[@]}"
  do
    echo "$i - ${modules[$i]}"
    i=$((i+1))
  done
}

get_input() {
  read cur_user_input
  if [ "$cur_user_input" = -1 ]
  then
    exit
  fi
}


main() {
  welcome_message
  declare -A modules
  declare -A module_dict
  get_modules
  echo "Enter '-1' at any time to exit"
  while true
  do
        echo "Please enter the module numbers you want to practice separated by a space."
    print_available_modules
    get_input
    requested_modules=$cur_user_input
    echo $requested_modules

  done

}



main