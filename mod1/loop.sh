#!/usr/bin/env bash

for (( i=0; i<10; i++)); do
	echo $i
done

for i in $(seq 10); do
	echo $i
done

Frutas=(
'Laranja'
'Ameixa'
'Abacaxi'
'Manga'
'Amora'
)
for i in "${Frutas[@]}"; do
  echo $i
done

contador=0
while [[ $contador -lt ${#Frutas[@]} ]]; do # usar o hashtag é pra pegar só o tamanho do array
  echo $contador
  contador=$((contador+1))
done
