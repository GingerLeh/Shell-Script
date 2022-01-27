#!/usr/bin/env bash
#
# listaUsuarios.sh - descrição simples: Extrai usuários do /etc/passwd
# Site:       https://4fasters.com.br
# Autor:      Mateus Müller
# Manutenção: Mateus Müller
#
# ------------------------------------------------------------------------ #
# Irá extrai usuários do /etc/passwd, havendo a possibilidade de colocar em
# maísculo e em ordem alfabética
#
#  Exemplos:
#      $ ./listaUsuarios -s -m
#      Neste exemplo ficará em maiúsculo e em ordem alfabética
# ------------------------------------------------------------------------ #
# Histórico:
#
#   v1.0 24.01.2022, Alessa:
#       - Adicionado -s, -h & -v.
#   v1.1 24.01.2022, Alessa:
#       - Adicionado o case no lugar do if.
# ------------------------------------------------------------------------ #
# Testado em:
#   bash 5.0.17
# ------------------------------------------------------------------------ #
#
# ------------------------------- VARIÁVEIS ----------------------------------------- #
CHAVE_DEBUG=0
NIVEL_DEBUG=0

ROXO="\033[35;1m"
CIANO="\033[36;1m"

# ------------------------------------------------------------------------ #

# ------------------------------- TESTES ----------------------------------------- #

# ------------------------------------------------------------------------ #

# ------------------------------- FUNÇÕES ----------------------------------------- #
Debugar(){
  [$1 -le $NIVEL_DEBUG] && echo -e "${2} Debug $* --------" #verificar se o parâmetro é menor ou igual a NIVEL_DEBUG
}


Soma () {
  local total=0
  for i in $(seq  25);do
    Debugar 1 "$(ROXO)" "Entrei no for com valor: $1"
    total=$(($total+$i))
    Debugar 2 "$(CIANO)" "Depois da soma: $total"
  done
  echo $total
}

# ------------------------------------------------------------------------ #

# ------------------------------- EXECUÇÃO ----------------------------------------- #
case "$1" in
  -d) [ $2 ] && NIVEL_DEBUG=$2 ;; #verifica se tem alguma coisa no segundo parâmetro
   *) Soma                     ;;
esac
Soma

# ------------------------------------------------------------------------ #
