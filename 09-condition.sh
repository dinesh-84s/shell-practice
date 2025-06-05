#!/bin/bash



# -eq-- equal to 
# -lt-- less than
# -ne-- not equal
# -gt -- greater than

NUMBER=$1

if [ $NUMBER -lt 10 ]
then
    echo "Given number is $NUMBER less than 10"

else

     echo "Given number is $NUMBER is not less than 10"
fi
