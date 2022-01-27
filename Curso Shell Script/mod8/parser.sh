#!/usr/bin/env bash
#Parser genérico

ARQUIVO_DE_CONFICURACAO="$1"

[ ! -e "$ARQUIVO_DE_CONFICURACAO" ] && echo "Arquivo não existe" && exit 1
[ ! -r "$ARQUIVO_DE_CONFICURACAO" ] && echo "Sem acesso de leitura" && exit 1


while read -r linha
do
  [ "$(echo $linha | cut -c1)" = "#" ] && continue #vai verificar se o primeiro caracter é #, se não for continua
  [ ! "$linha" ] && continue #se nao tiver nada na linha (espaço em branco) continua

  chave="$(echo $linha | cut -d = -f 1)"
  valor="$(echo $linha | cut -d = -f 2)"

  echo "$CONF_$chave=$valor"

done < "$ARQUIVO_DE_CONFICURACAO"
