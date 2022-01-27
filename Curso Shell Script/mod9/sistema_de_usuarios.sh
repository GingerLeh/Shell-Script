#!/usr/bin/env bash
#
# sistema_de_usuarios.sh - Sistema para gerenciamento de usuários
#
# Site:
# Autor:      Alessa
# Manutenção: Alessa
#
# ------------------------------------------------------------------------ #
#  Este programa faz todas as funções de gerenciamento de usuários, como:
#  inserir, deletar, alterar.
#
#  Exemplos:
#      $ source sistema_de_usuarios.sh
#      $ ListaUsuarios
# ------------------------------------------------------------------------ #
# Histórico:
#
#   v1.0 27/01/2022, Alessa:
#       - Tratamento de erros com relação ao arquivo do banco de dados
#       - Lista usuários
# ------------------------------------------------------------------------ #
# Testado em:
#   bash 5.0.17
# ------------------------------------------------------------------------ #

# ------------------------------- VARIÁVEIS ----------------------------------------- #
ARQUIVO_BANCO_DE_DADOS="banco_de_dados.txt"

VERDE="\033[32;1m"
VERMELHO="\033[31;1m"
# ------------------------------------------------------------------------ #

# ------------------------------- TESTES ----------------------------------------- #
[ ! -e "$ARQUIVO_BANCO_DE_DADOS" ] && echo "ERRO. Arquivo não existe." && exit 1
[ ! -r "$ARQUIVO_BANCO_DE_DADOS" ] && echo "ERRO. Arquivo não tem permissão de leitura." && exit 1
[ ! -w "$ARQUIVO_BANCO_DE_DADOS" ] && echo "ERRO. Arquivo não tem permissão de escrita." && exit 1
# ------------------------------------------------------------------------ #

# ------------------------------- FUNÇÕES ----------------------------------------- #
ListaUsuarios(){
  while read -r linha
  do
    [ "$(echo $linha | cut -c1)" = "#" ] && continue
    [ ! "$linha" ] && continue

    local id=

  done < "$ARQUIVO_BANCO_DE_DADOS"

}
# ------------------------------------------------------------------------ #

# ------------------------------- EXECUÇÃO ----------------------------------------- #

# ------------------------------------------------------------------------ #
