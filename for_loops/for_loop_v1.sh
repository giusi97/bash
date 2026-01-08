#!/bin/bash
# ============================================================
# Script: for_loops.sh
#
# Scopo:
#   Mostrare diversi tipi di for loop in Bash e
#   chiarire la differenza tra:
#   - testo letterale
#   - espansione delle variabili
#
# Concetti chiave:
#   - brace expansion {a..f}
#   - for stile C
#   - variabili e parametri
#   - differenza tra ' ' e " "
# ============================================================


# ------------------------------------------------------------
# FOR CON BRACE EXPANSION
# ------------------------------------------------------------
# {a..f} viene espanso da Bash in:
# a b c d e f
# PRIMA che il loop inizi.
# ------------------------------------------------------------
for thing in {a..f}; do
    # ❌ con ' ' la variabile NON viene espansa
    # echo 'name is $thing'
    #
    # ✅ con " " la variabile viene espansa
    echo "name is $thing"
done


# ------------------------------------------------------------
# FOR STILE C CON CONTATORE
# ------------------------------------------------------------
max=5

for (( i=0; i < max; i++ )); do
    # ❌ 'thing is i' stampa testo fisso
    # echo 'thing is i'
    #
    # ✅ $i espande il valore della variabile
    echo "thing is $i"
done


# ------------------------------------------------------------
# FOR STILE C CON PARAMETRO DA LINEA DI COMANDO
# ------------------------------------------------------------
# $1 è il primo argomento passato allo script
param="$1"

for (( i=0; i < param; i++ )); do
    echo "thing is $i — prova usando param=$param"
done
