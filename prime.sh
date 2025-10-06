#!/bin/bash

echo "please enter the number"
read

if [ $(($NUMBER -lt 2)) -eq 0 ];then
    echo "Given number is prime number"
else 
    echo "Given number is not prime number"
fi