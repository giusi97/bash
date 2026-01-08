#!/bin/bash
# ============================================================
# Script: greet_dual_output.sh
#
# Scopo:
#   Dimostrare che una funzione Bash può:
#   1) scrivere il suo output su un file (side effect)
#   2) restituire lo stesso output a una variabile
#
# Questo script insegna un concetto FONDAMENTALE:
#   in Bash le funzioni NON restituiscono valori,
#   ma producono output su stdout.
#
# Sarà il chiamante a decidere:
#   - dove mandare quell'output
# ============================================================


# ------------------------------------------------------------
# FUNZIONE greet
#
# Accetta un nome come parametro ($1)
# e stampa un messaggio su stdout.
#
# Nota:
#   - echo NON è un "return"
#   - è solo output testuale
# ------------------------------------------------------------
greet() {
    local name=$1
    echo "hello $name (from func)"
}


# ------------------------------------------------------------
# CICLO SUGLI ARGOMENTI DELLO SCRIPT
#
# "$@" = tutti gli argomenti passati allo script
# Ogni output viene APPESO al file file.txt
# ------------------------------------------------------------
for name in "$@"; do
    greet "$name" >> file.txt
done


# ------------------------------------------------------------
# COMMAND SUBSTITUTION
#
# $(...) cattura lo stdout del comando
# e lo assegna a una variabile
#
# Qui NON scriviamo su file,
# ma trasformiamo l'output in dato
# ------------------------------------------------------------
var=$(greet Dave)


# ------------------------------------------------------------
# STAMPA FINALE
#
# Usiamo il valore catturato
# ------------------------------------------------------------
echo "var is $var"
