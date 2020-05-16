#!/bin/bash -x
echo "Welcome To Flip Coin Combination Problem"

IsHead=0;
randomCheck=$(( RANDOM%2 ))

if [[ IsHead -eq randomCheck ]]
then
	echo "Head"
else
	echo "Tail"
fi

