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
SEP=: #usada para alterar o separador no banco de dados, adaptação
VERDE="\033[32;1m"
VERMELHO="\033[31;1m"
TEMP=temp.$$ #cria um temp do programa
# ------------------------------------------------------------------------ #

# ------------------------------- TESTES ----------------------------------------- #
[ ! -e "$ARQUIVO_BANCO_DE_DADOS" ] && echo "ERRO. Arquivo não existe." && exit 1
[ ! -r "$ARQUIVO_BANCO_DE_DADOS" ] && echo "ERRO. Arquivo não tem permissão de leitura." && exit 1
[ ! -w "$ARQUIVO_BANCO_DE_DADOS" ] && echo "ERRO. Arquivo não tem permissão de escrita." && exit 1
# ------------------------------------------------------------------------ #

# ------------------------------- FUNÇÕES ----------------------------------------- #
MostraUsuarioNaTela(){
  local id="$(echo $linha | cut -d $SEP -f 1)"
  local nome="$(echo $linha | cut -d $SEP -f 1)"
  local email="$(echo $linha | cut -d $SEP -f 1)"

  echo -e "${VERDE}ID: ${VERMELHO}$id"
  echo -e "${VERDE}NOME: ${VERMELHO}$nome"
  echo -e "${VERDE}EMAIL: ${VERMELHO}$email"
}

ListaUsuarios (){
  while read -r linha
  do
    [ "$(echo $linha | cut -c1)" = "#" ] && continue
    [ ! "$linha" ] && continue

      MostraUsuarioNaTela "$linha"

  done < "$ARQUIVO_BANCO_DE_DADOS"

}
ValidaExistenciaUsuario (){
  #-i é para maiusculas e minusculas e o -q é para quiet. Se retornar 1 é pq o usuario nao existe
  grep -i -q "$1$SEP" "$ARQUIVO_BANCO_DE_DADOS"
}

InsereUsuario (){
  local nome="$(echo $1 | cut -d $SEP -f 2)"
  if ValidaExistenciaUsuario "$nome"
  then
    echo "ERRO. Usuario já existe"
  else
    echo "$*" >> "$ARQUIVO_BANCO_DE_DADOS" #vai ser colocado o novo usuario no final do arquivo
    echo "Usuário cadastrado com sucesso!"
  fi
  OrdenaLista
}

Apagausuario (){
  ValidaExistenciaUsuario "$1" || echo "Usuário não existe" || return #retorna falso.

  grep -i -v "$1$SEP" "$ARQUIVO_BANCO_DE_DADOS" > "$TEMP" #traz tudo do banco menos o usuario desejado
  mv "$TEMP" "$ARQUIVO_BANCO_DE_DADOS" #move de volta para o arquivo original

  echo "Usuário removido com sucesso!"
  OrdenaLista
}

OrdenaLista (){
  sort "$ARQUIVO_BANCO_DE_DADOS" > "$TEMP"
  mv "$TEMP" "$ARQUIVO_BANCO_DE_DADOS"
}
# ------------------------------------------------------------------------ #

# ------------------------------- EXECUÇÃO ----------------------------------------- #

# ------------------------------------------------------------------------ #
