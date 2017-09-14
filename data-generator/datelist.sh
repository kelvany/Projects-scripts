#!/bin/bash

if [ "$1" == "" ]; then 
    echo "Data inexistente"
    echo "Syntax: $0 11092001 20072017"
fi
#Verifica coomprimento da data
datainicio="$(echo -n $1 | wc -m)"
datafim="$(echo -n $2 | wc -m)"
#primeiro parametro
if [ $datainicio -lt 8 -o $datainicio -gt 8 ]; then 
    echo "O primeiro parametro tem o comprimento incorreto. $datainicio"
fi
#segundo parametro
if [ $datafim -gt 8 -o $datafim -lt $datainicio ]; then
	echo "O segundo parametro tem o comprimento incorreto. $datafim "
fi
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
dia="$(echo $1 | cut -c1-2)"      #dia inicial
mes="$(echo $1 | cut -c3-4)"      #mês inicial
ano="$(echo $1 | cut -c5-8)"      #ano inicial
anofinal="$(echo $2 | cut -c5-8)" #ano final
anof="$(echo "$anofinal + 1" | bc)"
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
while [ $ano -lt $anof ]; do
	

	dia="$(echo "$dia + 1" | bc)"
	if [ $dia -ge 32 ]; then
		mes="$(echo "$mes + 1" | bc)"
		dia="$(echo "$dia - 31" | bc)"
	fi
	if [ $mes -ge 13 ]; then
		ano="$(echo "$ano + 1" | bc)"
		mes="$(echo "$mes - 12" | bc)"
	fi

# Se o dia começar com zero
	if [ $dia -le 9 ]; then
		dia="0$dia"
	fi
# Se o mes começar com zero

final="$(echo -n $dia$mes$ano | wc -m )"
if [ $final -eq 7 ];then
	echo $dia 0$mes$ano | tr -d " " 
else
	echo "$dia$mes$ano"
fi

done > temp

cat temp > calendar.final
rm temp 




















