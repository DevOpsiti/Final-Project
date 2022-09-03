#!/usr/bin/bash

## Test Case:

cd $db_n

echo "********************************* Create New Table *****************************"
read -p "Enter your New Table Name: " tb_n

if [[ -f $tb_n ]];
then
        echo "Opps, Table name is already exist !!"
        select te in create_another_table back_to_database back_menu
        do
        case $te in
        create_another_table ) 
        cd ../
        . create_table.bash;;
        back_to_database )
        cd ../
         . main_db.bash;;
        back_menu )
        cd ../
         . main.bash;;
        * ) echo "Invaled Number" ;;
        esac
        done
elif [[ -z $tb_n ]] || [[ $tb_n == [0-9]* ]]
then
        echo "Opps, There is a syntax error"
        select te in try_again back_to_database back_menu 
        do
        case $te in
        try_again )

        cd ../
         . create_table.bash;;

        back_to_database )

        cd ../
         . main_db.bash;;
        back_menu )
        cd ../
         . main.bash;;
        * ) echo "Invaled Number" ;;
        esac
        done
        
elif [[ $tb_n == $db_n ]];
then
        echo "it is not allowed to enter the table name with the same name as the database"
        select te in try_again back_to_database back_menu 
        do
        case $te in
        try_again )
        cd ../
         . create_table.bash;;
        back_to_database )
        cd ../
         . main_db.bash;;
        back_menu )
        cd ../
         . main.bash;;
        * ) echo "Invaled Number" ;;
        esac
        done

elif [[ ! -f $tb_n ]]
then
        if [[ $tb_n == *" "* ]]
                then
                x=$(echo $tb_n | sed 's/ /_/g')
                touch $x
                echo "the table has been created successfully"
                echo "your table name is: $x"
                cd ../
                . table_details.bash
                select te in add_another_table back_menu 
                do
                case $te in
                add_another_table )
                cd ../
                . create_table.bash ;;
                back_menu ) 
                cd ../
                . main_db.bash;;
                * ) echo "Invaled Number" ;;
                esac
                done


        else
        
                touch $tb_n
                echo "the table has been created successfully"
                cd ../
                . table_details.bash

                select te in add_another_table back_menu 
                do
                case $te in
                add_another_table )
                cd ../
                . create_table.bash ;;
                back_menu ) 
                cd ../
                . main_db.bash;;
                * ) echo "Invaled Number" ;;
                esac
                done
        fi
fi
