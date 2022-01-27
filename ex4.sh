#!/usr/bin/env bash
#
# imc.sh - descrição simples: calcula imc do usuário
# Site:
# Autor:      Alessa
# Manutenção: Alessa
#
# ------------------------------------------------------------------------ #
# Irá pedir a entrada do peso e altura do usuário e irá retornar o imc
#
#  Exemplos:
#      $ ./imc 45 1.70
#      Neste exemplo o programa retornará o imc com base no peso e na altura
# ------------------------------------------------------------------------ #
# Histórico:
#
#   v1.0 26.01.2022, Alessa:
#
# ------------------------------------------------------------------------ #
# Testado em:
#   bash 5.0.17
# ------------------------------------------------------------------------ #
#
# ------------------------------- VARIÁVEIS ----------------------------------------- #

MENSAGEM_USO="
 $(basename $0) - [OPÇÕES]
   -i - Cálculo do IMC
   -h - Menu de ajuda
   -v - Versão
 "
 VERSAO="v1.0"
 PESO=0
 ALTURA=0
# ------------------------------------------------------------------------ #

# ------------------------------- TESTES ----------------------------------------- #

# ------------------------------------------------------------------------ #

# ------------------------------- FUNÇÕES ----------------------------------------- #

# ------------------------------------------------------------------------ #

# ------------------------------- EXECUÇÃO ----------------------------------------- #

while test -n "$1" #testa se variavel não é nula
do
  case "$1" in
    -h) echo "$MENSAGEM_USO"             ;;
    -v) echo "$VERSAO"                   ;;
    -i) echo -n " Digite a altura - EX: (1.70) : "
        read ALTURA
        echo -n " Digite o peso - EX: (65.0) : "
        read PESO
        IMC=`echo "scale=2; $PESO / ( $ALTURA ^ 2 )" | bc -l` #bc é usado para Cálculos e scale pega a qtd de dígitos após a vírgula
        NIMC=`echo "scale=2; $PESO / ( $ALTURA ^ 2 )" | bc -l | sed 's/\.//'` #retira a parte decimal para verificar o IMC
        if [[ $NIMC -lt 1700 ]] ; then
          echo "Está muito abaixo do peso"
        elif [[ $NIMC -ge 1700 ]] && [[ $NIMC -le 1849 ]] ; then
          echo "Está abaixo do peso"
        elif [[ $NIMC -gt 1849 ]] && [[ $NIMC -le 2499 ]] ; then
          echo "Está dentro do peso ideal"
        elif [[ $NIMC -gt 2499 ]] && [[ $NIMC -le 2999 ]] ; then
          echo "Está acima do peso ideal"
        elif [[ $NIMC -gt 2999 ]] && [[ $NIMC -le 3499 ]] ; then
          echo "Está com Obesidade nível I"
        elif [[ $NIMC -gt 3499 ]] && [[ $NIMC -le 3999 ]] ; then
          echo "Está com Obesidade nível II (severa)."
        elif [[ $NIMC -gt 3999 ]] ; then
          echo "Está com Obesidade nível III (mórbida)."
        else
          echo "Erro"
        fi
          echo "com o IMC igual a $IMC"
          echo                           ;;
     *) echo "Opção inválida" && exit 1  ;;
  esac
  shift #vai pra prox variavel
done




# ------------------------------------------------------------------------ #
