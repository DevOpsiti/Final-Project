#!/usr/bin/bash

## Test Case:
clear
echo "********************************************************* Connect TO Database *********************************************"

# show all Database
if [[ $(ls -l | grep "^d" | wc -l) < 1 ]]; 
then
    echo "Database is Empty !!" 
    select te in back_menu 
    do
    case $te in
    back_menu ) . main.bash;;
    * ) echo "Invaled Number" ;;
    esac
    done 
else

ls -l | grep "^d" | awk '{print $9,$6,$7,$8}' | cat -n 
fi

# User Input Data
read -p "Database Name: " db_n

# check input include data and not empty string
if [[ -z $db_n ]];
then
        echo "Opps, Please Enter Your Database Name ?!"
        select te in try_again back_menu 
        do
        case $te in
        try_again ) . connect_db.bash ;;
        back_menu ) . main.bash;;
        * ) echo "Invaled Number" ;;
        esac
        done

#check database is exist or not
elif [[ ! -d $db_n ]];
then
    echo "Opps, Database Name Is Not Exist !!"
        select te in try_again back_menu 
        do
        case $te in
        try_again ) . connect_db.bash ;;
        back_menu ) . main.bash;;
        * ) echo "Invaled Number" ;;
        esac
        done

elif [[ -d $db_n ]];
then
echo "Successfully Connected"
. main_db.bash

fi

