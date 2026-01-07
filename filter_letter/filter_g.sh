#!/bin/bash
# ============================================
# Script: filtra_g.sh
# Scopo : stampare i nomi che iniziano per "g"
# Input : file di testo (1 nome per riga)
# Output: stdout (può essere rediretto)
# ============================================

set -euo pipefail

# Controllo: parametro presente
if [ "$#" -lt 1 ]; then
  echo "Uso: $0 FILE" >&2
  exit 1
fi

FILE="$1"

# Controllo: file esistente
if [ ! -f "$FILE" ]; then
  echo "Errore: file non trovato: $FILE" >&2
  exit 1
fi

# Lettura file riga per riga
while IFS= read -r NOME; do
  # Salta righe vuote
  [ -z "$NOME" ] && continue

  # Filtra nomi che iniziano per "g"
  if [[ "$NOME" == g* ]]; then
    echo "$NOME"
  fi
done < "$FILE"
