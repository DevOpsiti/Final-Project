#!/usr/bin/bash
clear
echo "-------------------------> Choose what operation you want to do !! <---------------------------"

select num in Create_Table List_All_Table Delete_Of_Table Insert_Into_Table Delete_Record Update_Record Back_to_database 
do
case $num in
Create_Table ) 
. create_table.bash;;
List_All_Table ) 
. list_db.bash;;
Delete_Of_Table ) 
. delete_table.bash;;
Insert_Into_Table ) 
. insert_table.bash;;
Delete_Record ) 
 . delete_row.bash;;
 Update_Record ) 
 . update_row.bash;;
 Back_to_database ) 
 . main.bash;;
* ) echo "Invaled Number"

esac
done