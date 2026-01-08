#!/bin/bash
# ============================================================
# Script: greet.sh
#
# Scopo:
#   Stampare un saluto usando un nome.
#
#   Il nome può arrivare:
#   1) come ARGOMENTO da linea di comando
#   2) oppure essere richiesto all'utente tramite input (read)
#
# Questo script serve per imparare:
#   - $1 (argomenti posizionali)
#   - if / else
#   - test [[ -n ]]
#   - read -p
# ============================================================


# ------------------------------------------------------------
# CONTROLLO ARGOMENTO
#
# $1 è il primo argomento passato allo script.
# Esempio:
#   ./greet.sh Giusi
#   $1 = "Giusi"
#
# [[ -n $1 ]] significa:
#   "la stringa NON è vuota?"
# ------------------------------------------------------------
if [[ -n $1 ]]; then

    # Se l'argomento esiste, lo usiamo come nome
    name=$1

else
    # --------------------------------------------------------
    # Se NON è stato passato alcun argomento,
    # chiediamo il nome all'utente da tastiera.
    #
    # -p serve per stampare il messaggio senza usare echo
    # read salva l'input nella variabile "name"
    # --------------------------------------------------------
    read -p 'Enter your name: ' name
fi


# ------------------------------------------------------------
# OUTPUT FINALE
#
# Usiamo la variabile $name qualunque sia la sua origine:
# - argomento
# - input da tastiera
# ------------------------------------------------------------
echo "Hello $name"
