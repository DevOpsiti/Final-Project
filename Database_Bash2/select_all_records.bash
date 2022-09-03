#!/usr/bin/bash

## Test Case:

cd $db_n
echo "********************************* Delete row *****************************"

ls -l | grep "^-" | awk '{print $9,$6,$7,$8}' | cat -n
echo "Which table you want to insert from ?"
read -p "Table Name: " tb_n

while [[ -z $tb_n ]]
do
echo "Opps, Please Enter Your  ?!!"
echo "Enter your Table Name"
read  tb_n
done


while [[ ! -f $tb_n ]];
do
echo "Opps, Table name is not exist !!"
echo "Enter your Table Name correctly"
read  tb_n
done


if [[ $(awk 'END { print NR } ' $tb_n ) == 1 ]]; 
then
    echo "Table not include any information !!" 
    select te in  back_menu 
    do
    case $te in
    back_menu )
    cd ../
    . main_db.bash;;
    * ) echo "Invaled Number" ;;
    esac
    done 

fi



awk '{print NR,$0}' $tb_n
 select te in  back_menu 
    do
    case $te in
    back_menu )
    cd ../
    . main_db.bash;;
    * ) echo "Invaled Number" ;;
    esac
    done 