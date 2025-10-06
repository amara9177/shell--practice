#!/bin/bash

echo "please enter the number"
read

if [ $(num -lt 2) ];then
    echo "Given number is prime number"
else 
    echo "Given number is not prime number"
fi