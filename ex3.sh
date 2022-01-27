#!/usr/bin/env bash
inicio=0
fim=100
[$inicio -ge $fim] && exit 1
for i in $(seq $inicio $fim);do
  for j in $(seq $i $fim);do
    echo "*"
  done
  echo -e "\n" #imprime o pular linha
done
