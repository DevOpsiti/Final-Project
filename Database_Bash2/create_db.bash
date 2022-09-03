#!/usr/bin/bash
## Test Case:
clear
echo "********************************************************* Create New Database *********************************************"
# input Database
read -p "Please Enter Your Database Name :" d_n

# check database if exist
if [[ -d $d_n ]];
then
        echo "Opps, This Database Is Already Existed !!"
        select te in connect_to_database add_another_database back_menu 
        do
        case $te in
        connect_to_database ) . connect_db.bash;;
        add_another_database ) . create_db.bash;;
        back_menu ) . main.bash;;
        * ) echo "Invaled Number" ;;
        esac
        done

# if input is empty
elif [[ -z $d_n ]];
then
        echo "Opps, Please Enter Your Database Name ?!!"
        select te in try_again back_menu 
        do
        case $te in
        try_again ) . create_db.bash;;
        back_menu ) . main.bash;;
        * ) echo "Invaled Number" ;;
        esac
        done

# if database is not exist
elif [[ ! -d $d_n ]] ;
then
        # If you find any spaces in the input
        if [[ $d_n == *" "* ]] && [[ $d_n != [0-9]* ]] && [[ $d_n != [a-z]* ]]
        then
                x=$(echo $d_n | sed 's/ /_/g')
                mkdir $x
                echo "$x Created Sucessfully"
                select te in add_another_database back_menu 
                do
                case $te in
                add_another_database ) . create_db.bash ;;
                back_menu ) . main.bash;;
                * ) echo "Invaled Number" ;;
                esac
                done
        elif [[ $d_n == [0-9]* ]];
        then
                echo "Opps, There is a syntax error"
                echo "It is not allowed to enter numbers at the beginning"
                        select te in try_again back_menu 
                        do
                        case $te in
                        try_again ) . create_db.bash;;
                        back_menu ) . main.bash;;
                        * ) echo "Invaled Number" ;;
                        esac
                        done
        elif [[ $d_n == [a-z]* ]]
        then
                echo "Opps, There is a syntax error"
                echo "It is not allowed to enter a lowercase letter at the beginning"
                        select te in try_again back_menu 
                        do
                        case $te in
                        try_again ) . create_db.bash;;
                        back_menu ) . main.bash;;
                        * ) echo "Invaled Number" ;;
                        esac
                        done
        else 

                mkdir $d_n
                echo "$d_n Created Sucessfully"
                select te in add_another_database back_menu 
                do
                case $te in
                add_another_database ) . create_db.bash ;;
                back_menu ) . main.bash;;
                * ) echo "Invaled Number" ;;
                esac
                done
        fi
fi