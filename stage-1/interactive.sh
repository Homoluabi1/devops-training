#!/bin/bash

# Interactive script example

echo "Welcome to DevOps Training!"
echo ""

# Ask for user's name
read -p "What is your name? " NAME

# Ask for experience level
read -p "How many months have you been learning DevOps? " MONTHS

echo ""
echo "Hello $NAME!"

if [ $MONTHS -eq 0 ]; then
    echo "You are just starting out — welcome to the journey!"
elif [ $MONTHS -lt 3 ]; then
    echo "You are $MONTHS month(s) in — keep going, you're building foundations!"
elif [ $MONTHS -lt 6 ]; then
    echo "You are $MONTHS months in — you're getting solid now!"
else
    echo "You are $MONTHS months in — you're becoming a pro!"
fi

echo ""
echo "Good luck with your DevOps journey, $NAME!"
