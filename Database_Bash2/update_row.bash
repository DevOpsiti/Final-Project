#!/usr/bin/bash

## Test Case:

cd $db_n
echo "********************************* Delete row *****************************"

ls -l | grep "^-" | awk '{print $9,$6,$7,$8}' | cat -n
echo "Which table you want to insert from ?"
read -p "Table Name: " tb_n

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





read ch

fpk=$(awk -F: '{if(NR==2){for(i=1;i<=NF;i++){if($i=="'$ch'") print i}}}' $tb_n)

if [[ $fpk == "" ]];
then
    echo "Not Found"
else

coloumnsCount=$(awk -F: 'NR==1 {print NF}' $tb_n)
for (( i=1;i<$coloumnsCount;i++ ))
do
column=$(grep $ch $tb_n | awk '{print $0}')
col_name=$(echo $column | cut -d ":" -f $i)
col_type=$(echo $column | cut -d ":" -f $i)


echo "new value column : $col_name "
read new_value
sed -i "$NR s/$col_name/'$new_value'/g" $tb_n""
echo "new value type: $col_type "
read new_value
sed -i "$NR s/$col_type/'$new_value'/g" $tb_n""

done
fi