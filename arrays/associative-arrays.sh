#!/bin/bash
# ============================================================
# associative_array.sh
# Esercizio: array associativi (hash map / dizionari) in Bash
#
# Obiettivi:
# 1) Capire cosa sono gli array associativi: chiavi -> valori
# 2) Dichiararli correttamente con declare -A
# 3) Popolarli con più assegnazioni
# 4) Stampare valori per chiave
# 5) Stampare le chiavi (parameter expansion: ${!arr[@]})
# 6) Iterare su chiavi e coppie chiave=valore
#
# Requisiti:
# - Array associativi supportati da Bash 4+
#   (Su macOS vecchi può esserci Bash 3.x di default)
# ============================================================

# ------------------------------------------------------------
# 0) "Feature check": il mio Bash supporta gli array associativi?
# ------------------------------------------------------------
# Bash mette la versione in BASH_VERSINFO[0] (major).
# Associativi arrivano da Bash 4.
if (( BASH_VERSINFO[0] < 4 )); then
  echo "Errore: gli array associativi richiedono Bash >= 4 (tu hai ${BASH_VERSINFO[0]})." >&2
  echo "Soluzione: installa bash recente e lancia lo script con quel bash." >&2
  exit 1
fi

# ------------------------------------------------------------
# 1) Dichiarazione array associativo
# ------------------------------------------------------------
# -A significa "associative": le chiavi non sono numeri, sono stringhe.
declare -A arr

# ------------------------------------------------------------
# 2) Popolamento: chiave=valore
# ------------------------------------------------------------
# Nota: puoi assegnare più coppie nella stessa riga.
# Qui usiamo 3 chiavi: foo, bar, baz
arr[foo]=1 arr[bar]=2 arr[baz]=3

# ------------------------------------------------------------
# 3) Accesso per chiave
# ------------------------------------------------------------
# Sintassi:
#   ${arr[chiave]}
echo "${arr[foo]}"
echo "${arr[bar]}"
echo "${arr[baz]}"

# ------------------------------------------------------------
# 4) Stampare le chiavi
# ------------------------------------------------------------
# ${!arr[@]} o ${!arr[*]} espande l'elenco delle chiavi.
# DIFFERENZA * vs @:
# - "${!arr[*]}" => una stringa unica con tutte le chiavi
# - "${!arr[@]}" => tante stringhe quante sono le chiavi (meglio per i for)
echo "${!arr[*]}"

# ------------------------------------------------------------
# 5) Iterare sulle chiavi
# ------------------------------------------------------------
# Qui vogliamo una chiave per volta: usiamo "${!arr[@]}"
for key in "${!arr[@]}"; do
  echo "got key: $key"
done

# ------------------------------------------------------------
# 6) Iterare su chiavi e valori
# ------------------------------------------------------------
for key in "${!arr[@]}"; do
  # Estrai il valore dalla chiave corrente
  value="${arr[$key]}"

  # Stampa coppia chiave=valore
  echo "got pair: $key=$value"
done

# ------------------------------------------------------------
# Note importanti
# ------------------------------------------------------------
# - L'ordine delle chiavi NON è garantito: un associativo è una hash map.
# - Se vuoi un ordine stabile, devi ordinare le chiavi (es. con sort).
#
# Esempio (ordine alfabetico):
# for key in $(printf '%s\n' "${!arr[@]}" | sort); do
#   echo "$key=${arr[$key]}"
# done
