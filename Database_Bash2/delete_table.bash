#!/usr/bin/bash

## Test Case:

cd $db_n

echo "********************************* Delete Table *****************************"

if [[ $(ls -l | grep "^-" | wc -l) < 1 ]]; 
then
    echo "Database not include any taple !!" 
    select te in create_table back_menu 
    do
    case $te in
    create_table )
    cd ../
    . create_table.bash ;;
    back_menu )
    cd ../
    . main_db.bash;;
    * ) echo "Invaled Number" ;;
    esac
    done 

fi

read -p "Table Name: " tb_n

if [[ -z $tb_n ]];
then
        echo "Error, Please enter your Table name ?!"
        select te in enter_the_name_again back_menu 
        do
        case $te in
        enter_the_name_again ) 
        cd ../
        . delete_table.bash ;;
        back_menu )
        cd ../
         . main_db.bash;;
        * ) echo "Invaled Number" ;;
        esac
        done
elif [[ ! -f $tb_n ]];
then
echo "The Table is not exist"
    select te in another_name back_menu 
    do
    case $te in
    another_name ) 
    cd ../
    . delete_table.bash ;;
    back_menu ) 
    cd ../
    . main_db.bash;;
    * ) echo "Invaled Number" ;;
    esac
    done

elif [[ -f $tb_n ]]
then
echo "Are you sure delete $tb_n ?![Y/N]"
    read tp
    case $tp in 
    [Yy]* )
    rm  $tb_n
    echo "Deleted"
    cd ../
    . main_db.bash ;;

    [Nn]* ) 
    cd ../
    . main_db.bash ;;
    * ) echo "Invaled Number";;
    esac

select te in delete_another_table back_menu 
do
case $te in
delete_another_table )
cd ../
. delete_table.bash ;;
back_menu ) 
cd  ../
. main_db.bash;;
 * ) echo "Invaled Number" ;;
esac
done
fi




