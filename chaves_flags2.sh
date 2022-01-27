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
USUARIOS="$(cat /etc/passwd | cut -d : -f 1)"
MENSAGEM_USO="
 $(basename $0) - [OPÇÕES]


   -h - Menu de ajuda
   -v - Versão
   -s - Ordernar a saída
 "
 VERSAO="v1.1"
# ------------------------------------------------------------------------ #

# ------------------------------- TESTES ----------------------------------------- #

# ------------------------------------------------------------------------ #

# ------------------------------- FUNÇÕES ----------------------------------------- #

# ------------------------------------------------------------------------ #

# ------------------------------- EXECUÇÃO ----------------------------------------- #

case "$1" in
  -h) echo "$MENSAGEM_USO" && exit 0   ;;
  -v) echo "$VERSAO" && exit 0         ;;
  -s) echo "$USUARIOS" | sort && exit 0;;
   *) echo "$USUARIOS"                 ;;
esac

# ------------------------------------------------------------------------ #
