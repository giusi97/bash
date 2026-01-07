#!/bin/bash
# ------------------------------------------------------------
# Questo è lo shebang.
# Dice al sistema: "quando esegui questo file, usa Bash".
# Senza questa riga, il sistema potrebbe non sapere come
# interpretare il file.
# ------------------------------------------------------------

set -euo pipefail
# ------------------------------------------------------------
# Modalità "sicura" di Bash:
# -e : se un comando fallisce, lo script si ferma
# -u : se usi una variabile non definita, errore
# -o pipefail : se una pipe fallisce, errore
#
# Serve a evitare comportamenti strani e silenziosi.
# ------------------------------------------------------------


# ------------------------------------------------------------
# CONTROLLO 1: è stato passato almeno un argomento?
#
# "$#" contiene il numero di argomenti passati allo script.
# Se è minore di 1, significa che non abbiamo ricevuto il file.
# ------------------------------------------------------------
if [ "$#" -lt 1 ]; then
  echo "Uso: $0 FILE" >&2
  # $0 è il nome dello script
  # >&2 significa: manda il messaggio su stderr (errore)
  exit 1
  # exit 1 = termina lo script con errore
fi


# ------------------------------------------------------------
# Qui prendiamo il primo argomento ($1)
# e gli diamo un nome leggibile: FILE
#
# Esempio:
# ./filtra_g.sh nome.txt
# $1 = nome.txt
# FILE = nome.txt
# ------------------------------------------------------------
FILE="$1"


# ------------------------------------------------------------
# CONTROLLO 2: il file esiste davvero?
#
# -f "$FILE" significa:
# "esiste un file normale con questo nome?"
#
# ! -f significa:
# "NON esiste"
# ------------------------------------------------------------
if [ ! -f "$FILE" ]; then
  echo "Errore: file non trovato: $FILE" >&2
  exit 1
fi


# ------------------------------------------------------------
# LETTURA DEL FILE RIGA PER RIGA
#
# while ... do ... done
# = ciclo
#
# read -r NOME:
#   - legge UNA riga dal file
#   - la mette nella variabile NOME
#
# IFS= :
#   - evita che Bash spezzi la riga sugli spazi
#
# done < "$FILE":
#   - dice a Bash di leggere dal file
#     invece che dalla tastiera
# ------------------------------------------------------------
while IFS= read -r NOME; do

  # ----------------------------------------------------------
  # Se la riga è vuota, saltiamo al prossimo giro del ciclo.
  #
  # -z "$NOME" significa:
  # "la stringa è vuota?"
  #
  # continue = vai alla prossima riga
  # ----------------------------------------------------------
  [ -z "$NOME" ] && continue


  # ----------------------------------------------------------
  # FILTRO VERO E PROPRIO
  #
  # [[ "$NOME" == g* ]]
  #
  # significa:
  # "la stringa NOME inizia con la lettera g?"
  #
  # g* = g seguita da qualunque cosa
  # ----------------------------------------------------------
  if [[ "$NOME" == g* ]]; then
    echo "$NOME"
    # Stampiamo solo i nomi che passano il filtro
  fi

# ------------------------------------------------------------
# Fine del ciclo.
# Ogni riga del file è stata processata una per una.
# ------------------------------------------------------------
done < "$FILE"
