#!/bin/bash

carpeta_general="/home/dos/Code/Bash-Scripting/codelog"
# (The previous one is) the folder in which all the files will be saved:


######################################################
#####################**SCRIPT**#######################
######################################################

carpeta_general=$(echo "$carpeta_general" | sed -e "s/[/]$//g")

recursivamente() {
	for i in "$1"/*
	do
		if [ -d "$i" ]
		then
			echo "[dir]  $i"
			recursivamente "$i"
		elif [ -f "$i" ]
		then
			echo "[file] $i"
		fi	
	done
}

if [[ ! -z "$1" ]]
then
	case $1 in
		"-l" )
			recursivamente "$carpeta_general"
			exit;;
	esac
fi


# Checking if needed arguments are passed:
if [ "$#" -lt "2" ]
then
	printf "\n  - Argument 1 needed for the folder\n  - Argument 2 needed for the file\n  - Exiting...\n\n"
	exit
fi

# Setting folder and file variables:
lower1="$1"
lower2="$2"
lower1="${lower1,,}"
lower2="${lower2,,}"'.txt'
lower2=$(echo "$lower2" | sed -e "s/[ ]$/\ /g")
carpeta="${carpeta_general}"'/'"$lower1" # Carpeta = Carpeta general + '/' + Carpeta concreta
carpeta=$(echo "$carpeta" | sed -e "s/[/]$//g") # Drop last '/' if exists
fichero="${carpeta}"'/'"$lower2"

# If folder doesn't exists, create it (all the ones needed):
if [ ! -d "$carpeta" ]
then
	mkdir -p "$carpeta"
fi

# If file already exists, notify and ask if the user wants to continue (in case of appearing more than 2 arguments):
accion="open"
if [ -f "$fichero" ] && [ "$#" -gt "2" ]
then
	printf "Attention!\n File %s already exists in path %s." $fichero $carpeta
	printf "Choose what to do:\n  1) Open \n  2) Append and open\n  3) Override and open\n  4) Exit\n" 
	read respuesta
	case "$respuesta" in
		1 ) accion="open";;
		2 ) accion="append-open";;
		3 ) accion="override-open";;
		4 ) exit;;
	esac
else
	touch "$fichero"
fi

unset $1
unset $2

if [[ "$accion" == *override* ]]
then
	echo -n "$3" > "$fichero"
	for arg in $@
	do
		echo -n "${arg} " >> "$fichero"
	done
elif [[ "$accion" == *append* ]]
then
	for arg in $@
	do
		echo -n "${arg} " >> "$fichero"
	done
fi

if [[ "$accion" == *open* ]]
then
	nano "$fichero"
fi

echo "Done!";
