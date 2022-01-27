#!/usr/bin/env bash


for (( i=0; i<10; i++)); do
	echo $i
  NUM=$i
  if [[ $(($NUM%2)) -eq 0 ]]; then
    echo "$NUM Numero divisivel por 2"
  fi
done

#modo compacto

for i in $(seq 0 10)
do
  [ $(($i%2)) -eq 0 ] && echo "Número $i é divisível por 2"
done
