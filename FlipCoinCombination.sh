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

echo "Enter Number"
read n
tails=0;
heads=0;
for ((i=0;i<$n;i++))
do
	if [[ $((RANDOM%2)) -eq 1 ]]
	then
		tails=`expr $tails + 1`
	else
		heads=`expr $heads + 1`
	fi
done
headper=$((100*$heads/$n))
echo "Head Percentage ="$headper"%"
tailper=$((100*$tails/$n))
echo "Tail Percentage ="$tailper"%"

declare -A SingletDict
SingleDict["Heads"]=$headper
SingletDict["Tails"]=$tailper

if [[ ${SingletDict[headper]} -gt ${SingletDict[tailper]} ]]
then
	SingletDict[headper]=${SingletDict[tailper]}
	SingletDict[tailper]=$temp
fi
	echo ${SingletDict[@]}
if [[ $tails -gt $heads ]]
then
	echo "Winner Is Tail"
else
	echo "Winner Is Head"
fi

declare -A DoubletDict
DoubletDict+=(["HH"]=0 ["HT"]=0 ["TT"]=0 ["TH"]=0)
for ((i = 0; i <$n; i++)); 
do
randomCheck=$((RANDOM%4))
	case $check in
    		0)
    	  	  DoubletDict["HH"]=$((${DoubletDict["HH"]}+1))
    	  	  ;;
    		1)
	  	  DoubletDict["HT"]=$((${DoubletDict["HT"]}+1))
    	  	  ;;
    		2)
    	   	  DoubletDict["TT"]=$((${DoubletDict["TT"]}+1))
          	  ;;
    		3)
    	  	  DoubletDict["TH"]=$((${DoubletDict["TH"]}+1))
    	  	  ;;
	esac
done

for i in ${!DoubletDict[@]}
do
    DoubletDict[$i]=$(((${DoubletDict[$i]}*100)/$n))
done
arrayDoublet=($(for value in ${DoubletDict[@]}
do
    echo $value
done | sort ))
max=${arrayDoublet[3]}
echo ${arrayDoublet[@]}
for key in ${!DoubletDict[@]}
do
    if [[ $max -eq ${DoubletDict[$key]} ]]
    then
    echo "win combo $key"
    fi
done
