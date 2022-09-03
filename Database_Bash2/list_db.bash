#!/usr/bin/bash

## Test Case:
echo "********************************* List Of Database *****************************"

cd $db_n
#check the database is not empty
if [[ $(ls -l | grep "^-" | wc -l) < 1 ]]; 
then
    echo "sorry, database is empty !!"

select te in back_menu 
do
case $te in
back_menu )
cd ../
 . main_db.bash;;
 * ) echo "Invaled Number" ;;
esac
done

else
#check database is exist

ls -l | awk '{print $9,$6,$7,$8}'
#option
select te in back_menu 
do
case $te in
back_menu )
    cd ../
 . main_db.bash;;
 * ) echo "Invaled Number" ;;

esac
done

fi

