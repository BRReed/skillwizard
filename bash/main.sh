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

get_module_values() {
  while IFS="," read -r question answer; do module_dict+=( [$question]=$answer );
  done < $cur_mod
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

change_input_to_array() {
  requested_modules_arr=($requested_modules)
}

populate_module_dict() {
  for i in ${!requested_modules_arr[@]}
  do
    
    if [ ${modules[${requested_modules_arr[$i]}]} ]
    then 
      cur_mod=${modules[${requested_modules_arr[$i]}]}
      get_module_values
    fi
  done
}

qa_loop() {
  module_size=${#module_dict[@]}
  declare -a module_keys
  for key in "${!module_dict[@]}"
  do
  module_keys+=( "$key" )
  
  done
  while true
  do
    cur_question=${module_keys[RANDOM%$[module_size]]}
    echo $cur_question
    cur_answer=${module_dict[$cur_question]}
    cur_answer="${cur_answer%\"}"
    cur_answer="${cur_answer#\"}"
    get_input
    
    if [ "$cur_user_input" = "$cur_answer" ]
    then
      echo "CORRECT '${cur_answer}' is correct"
    else
      echo "INCORRECT '${cur_answer}' was the correct answer"
    fi
  done
}


main() {
  welcome_message
  declare -A modules
  declare -A module_dict
  declare -a requested_modules_arr
  get_modules
  echo "Enter '-1' at any time to exit"
  while true
  do
        echo "Please enter the module numbers you want to practice separated by a space."
    print_available_modules
    get_input
    requested_modules=$cur_user_input
    change_input_to_array
    populate_module_dict
    qa_loop

  done

}



main