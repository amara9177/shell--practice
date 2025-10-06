#!/bin/bash

Number=$1

echo "please enter the Number"
read

if [ $((NUMBER %2)) -eq 0 ];then
    echo "Given $NUMBER is even"
else
    echo "Given $Number is odd"
fi