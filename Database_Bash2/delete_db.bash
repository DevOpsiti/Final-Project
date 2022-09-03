#!/usr/bin/bash

## Test Case:
clear
echo "********************************* Delete Database *****************************"

# before input database name, check the database is empty or not
# if empty msg "database is empty" 
if [[ $(ls -l | grep "^d" | wc -l) < 1 ]]; 
then
    echo "Database is Empty !!" 
    select te in add_database back_menu 
    do
    case $te in
    add_database )
    . create_db.bash ;;
    back_menu )
    . main.bash;;
    * ) echo "Invaled Number" ;;
    esac
    done 

fi

# if database is not empty
# input database
read -p "Your Database Name: " d_db

# check database is exist or not exist
# 1- if not exist
if [[ -z $d_db ]];
then
    echo "Opps, Please enter your database name ?!"
    select te in enter_the_name_again back_menu 
    do
    case $te in
    enter_the_name_again ) . delete_db.bash ;;
    back_menu ) . main.bash;;
    * ) echo "Invaled Number" ;;
    esac
    done

# if database is not exist 
elif [[ ! -d $d_db ]]
then
    echo "Opps, Database name is not exist !!"
    select te in another_name back_menu 
    do
    case $te in
    another_name ) . delete_db.bash ;;
    back_menu ) . main.bash;;
    * ) echo "Invaled Number" ;;
    esac
    done

# 2- if exist 
# check the database is empty or not
# 1 - if not empty
elif [[ $(ls -l $d_db | grep "^-" | wc -l) > 0 ]] # or $(find $d_db -type f | wc -l)
then
echo "There is a table in your database. If you delete the database, it will automatically delete the tables. Are you sure about this step?[Y/N]"
    read tp
    case $tp in 
    [Yy]* )
    rm -r $d_db
    echo "Deleted"
    . main.bash ;;
    [Nn]* ) . main.bash ;;
    * ) echo echo "Invaled Number";;
    esac

# 2- if empty
else
rmdir $d_db
echo "Deleted"

# option
select te in delete_another_database back_menu 
do
case $te in
delete_another_database ) . delete_db.bash ;;
back_menu ) . main.bash;;
 * ) echo "Invaled Number" ;;
esac
done

fi


