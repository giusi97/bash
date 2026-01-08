#!/bin/bash
# ============================================================
# Script: conditionals.sh
#
# Scopo:
#   Dimostrare l'uso delle strutture condizionali in Bash:
#   - if
#   - confronti tra valori
#   - test su file
#   - until loop
#
# Questo script NON serve a "fare qualcosa",
# ma a capire COME Bash prende decisioni.
# ============================================================


# ------------------------------------------------------------
# CONFRONTO TRA VARIABILI (UGUAGLIANZA)
# ------------------------------------------------------------
a=2
b=2

# [[ $a == $b ]] → vero se le due stringhe sono uguali
if [[ $a == $b ]]; then
    echo 'a and b are the same'
fi


# ------------------------------------------------------------
# CONFRONTO TRA VARIABILI (DIVERSITÀ)
# ------------------------------------------------------------
c=2
d=3

# [[ $c != $d ]] → vero se le due stringhe sono diverse
if [[ $c != $d ]]; then
    echo 'c and d are not the same'
fi


# ------------------------------------------------------------
# TEST SU FILE
# ------------------------------------------------------------
# -f file.txt → vero se file.txt ESISTE ed è un file regolare
if [[ -f file.txt ]]; then
    echo 'file.txt exists'
fi


# ------------------------------------------------------------
# LOOP until
#
# until è l'opposto di while:
# - while → ripete FINCHÉ la condizione è vera
# - until → ripete FINCHÉ la condizione è falsa
#
# Qui:
#   - il loop continua FINCHÉ file.txt NON esiste
#   - appena il file compare, il loop termina
# ------------------------------------------------------------
until [[ -f file.txt ]]; do
    echo 'file.txt does not exist'
    sleep 1
done


# ------------------------------------------------------------
# Questa riga viene eseguita SOLO quando il loop termina,
# cioè quando file.txt finalmente esiste
# ------------------------------------------------------------
echo 'file exists'
