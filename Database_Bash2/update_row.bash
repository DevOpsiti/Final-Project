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
    select te in update_other_row back_to_database back_menu 
        do
        case $te in
        update_other_row )
        cd ../
         . update_row.bash;;
        back_to_database )
        cd ../
         . main_db.bash;;
        back_menu )
        cd ../
         . main.bash;;
        * ) echo "Invaled Number" ;;
        esac
        done   
else

coloumnsCount=$(awk -F: 'NR==1 {print NF}' $tb_n)
for (( i=1;i<$coloumnsCount;i++ ))
do
column=$(grep $ch $tb_n | awk '{print $0}')
col_name=$(echo $column | cut -d ":" -f $i)

check_datatype=$(awk -F: 'FNR == 1 {print $'$i'}' $tb_n)
col_type=$(echo $check_datatype | cut -d "%" -f 2)


echo "old value is : $col_name , datatype is $col_type "
read -p "new value is " new_value

if [[ $col_type == "int" ]]
    then

        while [[ $new_value == *[A-Za-z]* ]] || [[ $new_value == *" "* ]] || [[ -z $new_value  ]]; 
			do
        			echo "DataType should be integer"
        			echo "$col_name ($col_type) "
                    read -p "new value is " new_value
      		done
    sed -i "$NR s/$col_name/'$new_value'/g" $tb_n""

fi

if [[ $col_type == "string" ]]
    then
        while [[ $new_value == *[0-9]* ]] || [[ $new_value == *" "* ]] || [[ -z $new_value  ]];
			do
				echo "DataType should be string"
				echo "$col_name ($col_type)"
                read -p "new value is " new_value
			done
        sed -i "$NR s/$col_name/'$new_value'/g" $tb_n""

fi




done
echo "Updated successfully"
select te in update_other_row back_to_database back_menu 
        do
        case $te in
        update_other_row )
        cd ../
         . update_row.bash;;
        back_to_database )
        cd ../
         . main_db.bash;;
        back_menu )
        cd ../
         . main.bash;;
        * ) echo "Invaled Number" ;;
        esac
        done   

fi