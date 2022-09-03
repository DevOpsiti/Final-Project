#!/usr/bin/bash
clear
echo "********************************************************* Main Menu **********************************************************"
select num in Create_Database List_All_Database Connect_To_Database Delete_Of_Database Exit
do
case $num in
Create_Database ) . create_db.bash;;
List_All_Database ) . list_db_m.bash;;
Connect_To_Database ) . connect_db.bash;;
Delete_Of_Database ) . delete_db.bash;;
Exit ) exec bash
;;
* ) echo "Invaled Number"
esac
done

