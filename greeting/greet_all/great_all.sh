#!/bin/bash
# ============================================================
# Script: greet_all.sh
#
# Scopo:
#   Salutare UNA O PIÙ persone passate come argomenti
#
# Esempio:
#   ./greet_all.sh Giusi Marco Anna
#
# Output:
#   hello Giusi
#   hello Marco
#   hello Anna
#
# Questo script introduce concetti CHIAVE:
#   - funzioni in Bash
#   - variabili locali
#   - "$@" (tutti gli argomenti)
#   - for loop sugli argomenti
# ============================================================


# ------------------------------------------------------------
# FUNZIONE greet
#
# Una funzione è un blocco di codice riutilizzabile.
# Qui la funzione:
#   - riceve un parametro
#   - lo salva in una variabile locale
#   - stampa un saluto
#
# $1 → primo parametro della funzione (NON dello script!)
# ------------------------------------------------------------
greet() {

    # --------------------------------------------------------
    # local serve per NON "sporcare" lo scope globale
    # name esiste solo dentro la funzione
    # --------------------------------------------------------
    local name=$1

    echo "hello $name"
}


# ------------------------------------------------------------
# CICLO SUGLI ARGOMENTI
#
# "$@" rappresenta TUTTI gli argomenti passati allo script,
# mantenendo le parole separate correttamente.
#
# Esempio:
#   ./greet_all.sh Giusi Marco
#
# "$@" = "Giusi" "Marco"
# ------------------------------------------------------------
for name in "$@"; do

    # --------------------------------------------------------
    # Chiamiamo la funzione greet
    # passando il valore corrente del loop
    # --------------------------------------------------------
    greet "$name"

done
