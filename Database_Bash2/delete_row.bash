#!/usr/bin/bash

## Test Case:

cd $db_n
echo "********************************* Delete row *****************************"

ls -l | grep "^-" | awk '{print $9,$6,$7,$8}' | cat -n
echo "Which table you want to delete from ?"
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
col_type=$(echo $column | cut -d "%" -f 2)
pk_f=$(echo $column | cut -d "%" -f 3)

n_pf=$(echo $column | cut -d "%" -f 3 | wc -l)
if [[ $pk_f == "pk" ]];
then
    echo "$i Column Name : $col_name , it's Type : $col_type : "
    read -p "Enter $col_name: " iid

        while [[ $iid == *[A-Za-z]* ]] || [[ $iid == *" "* ]] || [[ -z $iid  ]]; 
			do
        			echo "DataType should be integer"
        			echo "$col_name ($col_type) "
        			read iid
      		done  

row=$(awk -F: '{{if(($'$i'=='$iid')){print NR}}}' $tb_n )
if [[ $row == "" ]];
then
echo "Opps, it's not found"
               select te in  back_menu 
                    do
                    case $te in
                    back_menu )
                    cd ../
                    . main_db.bash;;
                    * ) echo "Invaled Number" ;;
                    esac
                    done 
else

                sed -i ''$row'd' $tb_n
                echo "Done"
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
    
fi

done