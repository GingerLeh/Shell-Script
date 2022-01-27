#!/usr/bin/env bash
#arquivo igual ao conf.sh, porém usando o Parser de forma genérica
ARQUIVO_DE_CONFICURACAO="configuracoes.cf"
USAR_CORES=
USAR_MAIUSCULAS=
MENSAGEM="Mensagem de teste"
VERDE="\033[32;1m"
VERMELHO="\033[31;1m"

eval $(./parser.sh $ARQUIVO_DE_CONFICURACAO)

[ "$(echo $CONF_USAR_MAIUSCULAS)" = "1" ] && USAR_MAIUSCULAS=1
[ "$(echo $CONF_USAR_CORES)" = "1" ] && USAR_CORES=1

[ "$USAR_MAIUSCULAS" = "1" ] && MENSAGEM="$(echo -e $MENSAGEM | tr [a-z] [A-Z]) "
[ "$USAR_CORES" = "1" ] && MENSAGEM="$(echo -e ${VERDE}$MENSAGEM)"

echo "$MENSAGEM"
