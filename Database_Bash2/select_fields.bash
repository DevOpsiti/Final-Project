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


coloumnsCount=$(awk -F: 'NR==1 {print NF}' $tb_n)
for (( i=1;i<$coloumnsCount;i++ ))
do
column=$(awk -F: 'FNR == 1 {print $'$i'}' $tb_n)
col_name=$(echo $column | cut -d "%" -f 1)
#col_type=$(echo $column | cut -d "%" -f 2)
#pk_f=$(echo $column | cut -d "%" -f 3)
echo "$i)$col_name"
done
read -p "Enter your field:" fn
if [[ fn -eq 0 ]] || [[ fn -gt $coloumnsCount ]];
then
echo "Opps, error"
  select te in back_menu 
    do
    case $te in
    back_menu ) . main.bash;;
    * ) echo "Invaled Number" ;;
    esac
    done 
fi
if [[ -z $fn ]] || [[ $fn == *" "* ]] || [[ $fn == *[A-Za-z]* ]];
then
echo "Opps, error"
else
awk -F: '{print $'$fn'}' $tb_n 
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