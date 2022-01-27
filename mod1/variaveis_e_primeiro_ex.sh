#!/usr/bin/env bash

VAR="$1"
echo "Parâmetro:$VAR"

if [[ $VAR -gt 10 ]]; then
  echo "Nome do programa"
  echo $0
  echo "PID: $$"
fi

#outro exemplo
#[$1 -gt 10] && echo "Nome do programa: $0" | "PID de execução: $$""
