#!/usr/bin/bash

## Test Case:
clear
echo "********************************************************* List All Database ***********************************************"

# show all Database
if [[ $(ls -l | grep "^d" | wc -l) < 1 ]]; 
then
    echo "Database is Empty !!" 
    select te in back_menu 
    do
    case $te in
    back_menu ) . main.bash;;
    * ) echo "Invaled Number" ;;
    esac
    done 
else

ls -l | grep "^d" | awk '{print $9,$6,$7,$8}' | cat -n 

#option
select te in back_menu 
do
case $te in
back_menu ) . main.bash;;
* ) echo "Invaled Number";;
esac
done
fi