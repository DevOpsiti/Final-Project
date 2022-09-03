#!/usr/bin/bash

## Test Case:

cd $db_n
#check the database is not empty
if [[ $(ls -l | grep "^-" | wc -l) < 1 ]]; 
then
    echo "sorry, database is empty !!"

select te in create_table back_menu 
do
case $te in
create_table ) cd ../
. create_table.bash;;
back_menu )
cd ../
 . main_db.bash;;
 * ) echo "Invaled Number" ;;
esac
done
fi

ls -l | grep "^-" | awk '{print $9,$6,$7,$8}' | cat -n
echo "Which table you want to insert from ?"
read  cf

while [[ -z $cf ]]
do
echo "Opps, Please Enter Your  ?!!"
echo "Enter your Table Name"
read  cf
done


while [[ ! -f $cf ]];
do
echo "Opps, Table name is not exist !!"
echo "Enter your Table Name correctly"
read  cf
done

coloumnsCount=$(awk -F: 'NR==1 {print NF}' $cf)
for (( i=1;i<$coloumnsCount;i++ ))
do
column=$(awk -F: 'FNR == 1 {print $'$i'}' $cf)
col_name=$(echo $column | cut -d "%" -f 1)
col_type=$(echo $column | cut -d "%" -f 2)
pk_f=$(echo $column | cut -d "%" -f 3)

echo "Column Name : $col_name , it's Type : $col_type : "
read d

if [[ $col_type == "int" ]]
    then

        while [[ $d == *[A-Za-z]* ]] || [[ $d == *" "* ]] || [[ -z $d  ]]; 
			do
        			echo "DataType should be integer"
        			echo "$col_name ($col_type) "
        			read d
      		done
fi


if [[ $col_type == "string" ]]
    then
        while [[ $d == *[0-9]* ]] || [[ $d == *" "* ]] || [[ -z $d  ]];
			do
				echo "DataType should be string"
				echo "$col_name ($col_type)"
				read d
			done
fi

if [[ $pk_f == "pk" ]]
    then
        x=$( grep $d $cf | wc -l)
        if [[ $x == 1 ]]; 
			then
			echo "Opps, There is a syntax error"
			echo "This fields is exist"
select te in insert_again back_to_database back_menu 
        do
        case $te in
        insert_again )
        cd ../
         . insert_table.bash;;
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
	
fi

row+="$d"":"
done
echo $row >> $cf
echo "You Finish"
select te in insert_again back_to_database back_menu 
        do
        case $te in
        insert_again )
        cd ../
         . insert_table.bash;;
        back_to_database )
        cd ../
         . main_db.bash;;
        back_menu )
        cd ../
         . main.bash;;
        * ) echo "Invaled Number" ;;
        esac
        done 