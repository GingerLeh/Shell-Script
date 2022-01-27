#!/usr/bin/env bash
# ------------------------------- VARIÁVEIS ----------------------------------------- #
ARQUIVO_DE_CONFICURACAO="configuracoes.cf"
USAR_CORES=
USAR_MAIUSCULAS=
MENSAGEM="Mensagem de teste"
VERDE="\033[32;1m"
VERMELHO="\033[31;1m"

# ---------------------------------TESTES-------------------------------------- #
[ ! -r "$ARQUIVO_DE_CONFICURACAO" ] && echo "Não temos acesso de leitura" && exit 1
# ------------------------------- FUNÇÃO ----------------------------------------- #
DefinirParametros(){
  local parametro="$(echo $1 | cut -d = -f 1)"
  local valor="$(echo $1 | cut -d = -f 2)"

  case "$parametro" in
    USAR_CORES)      USAR_CORES="$valor"           ;;
    USAR_MAIUSCULAS) USAR_MAIUSCULAS="$valor"      ;;
  esac
}
# ------------------------------- EXECUÇÃO ----------------------------------------- #
while read -r linha
do
  [ "$(echo $linha | cut -c1)" = "#" ] && continue #vai verificar se o primeiro caracter é #, se não for continua
  [ ! "$linha" ] && continue #se nao tiver nada na linha (espaço em branco) continua
  DefinirParametros "$linha"
done < "$ARQUIVO_DE_CONFICURACAO"

[ "$USAR_MAIUSCULAS" = "1" ] && MENSAGEM="$(echo -e $MENSAGEM | tr [a-z] [A-Z]) "
[ "$USAR_CORES" = "1" ] && MENSAGEM="$(echo -e ${VERDE}$MENSAGEM)"

echo "$MENSAGEM"

# ------------------------------------------------------------------------ #
