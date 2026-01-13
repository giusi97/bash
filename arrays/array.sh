#!/bin/bash
# ============================================================
# array.sh
# Esercizio: array in Bash + differenza tra [*] e [@]
#
# Obiettivi:
# 1) Creare un array con elementi "semplici" e una stringa con spazi
# 2) Copiare l'array correttamente
# 3) Appendere nuovi elementi al secondo array
# 4) Accedere a elementi per indice (anche con variabile indice)
# 5) Capire cosa cambia tra "${array[*]}" e "${array[@]}"
# 6) Vedere l'effetto di * e @ nei cicli for
#
# Requisiti/Note:
# - Bash (non sh). Su Linux di solito: /usr/bin/env bash o /bin/bash
# - L'indice negativo (es. array[-1]) funziona con Bash moderno (>= 4.2).
#   Se su qualche macchina non va, puoi usare: "${array[${#array[@]}-1]}"
# ============================================================

# (Opzionale) Fallisci se usi variabili non definite, se un comando fallisce, ecc.
# Qui lo commentiamo per non "interrompere" l'esercizio se qualcosa cambia.
# set -euo pipefail

# ------------------------------------------------------------
# 1) Definizione array
# ------------------------------------------------------------
# Sintassi:
#   array=(elem1 elem2 elem3 ...)
#
# Attenzione: in Bash gli elementi sono separati da spazi.
# Se un elemento contiene spazi, deve essere quotato:
#   'ciao come stai'  oppure  "ciao come stai"
array=(foo bar bez 1234 'ciao come stai')

# ------------------------------------------------------------
# 2) Copia dell'array
# ------------------------------------------------------------
# Questo è il modo "giusto" per copiare un array preservando gli elementi.
# "${array[@]}" espande tutti gli elementi come elementi separati.
second_array=("${array[@]}")

# ------------------------------------------------------------
# 3) Append al secondo array
# ------------------------------------------------------------
# second_array+=( ... ) aggiunge nuovi elementi alla fine.
# Qui stiamo aggiungendo TRE elementi distinti:
#   sto
#   bene
#   grazie
#
# Nota: se tu volessi aggiungere UNA sola stringa "sto bene grazie" come
# elemento unico, dovresti fare:
#   second_array+=("sto bene grazie")
second_array+=(sto bene grazie)

# ------------------------------------------------------------
# 4) Accesso agli elementi per indice
# ------------------------------------------------------------
# Gli array in Bash sono 0-based: il primo elemento è indice 0.
echo "${array[0]}"  # foo
echo "${array[1]}"  # bar

# Indice negativo: -1 = ultimo elemento (Bash moderno).
echo "${array[-1]}" # "ciao come stai"

# Puoi usare una variabile come indice.
idx=2
echo "${array[$idx]}"   # bez

# In Bash, dentro [ ] il nome variabile è già interpretato come variabile,
# quindi ${array[idx]} equivale a ${array[$idx]} (stessa cosa).
echo "${array[idx]}"    # bez

# ------------------------------------------------------------
# 5) Differenza tra ${array[*]} e ${array[@]}
# ------------------------------------------------------------
# Attenzione: il punto NON è solo * vs @.
# La differenza vera salta fuori quando li metti tra virgolette.
#
# - "${array[*]}"  -> UN'UNICA stringa con gli elementi "incollati" insieme
#                     e separati dal primo char di IFS (di default spazio).
#
# - "${array[@]}"  -> PIÙ stringhe: una per ogni elemento dell'array.
#
# Senza virgolette, spesso sembra uguale, ma è un campo minato per via di
# word splitting e globbing. Qui usiamo SEMPRE virgolette.
echo "${array[*]}"
echo "${array[@]}"

# ------------------------------------------------------------
# 6) Ciclo for: caso con "${array[*]}"
# ------------------------------------------------------------
# Qui il ciclo gira UNA sola volta perché:
#   "${array[*]}" produce UNA sola stringa.
# Quindi item diventa "foo bar bez 1234 ciao come stai" in un colpo solo.
for item in "${array[*]}" ; do
    echo "item is : $item"
done

# ------------------------------------------------------------
# 7) Ciclo for: caso con "${array[@]}"
# ------------------------------------------------------------
# Qui invece il ciclo gira una volta per ogni elemento dell'array.
# L'elemento "ciao come stai" resta un pezzo unico (perché è quotato).
for item in "${array[@]}" ; do
    echo "item using @ is : $item"
done

# ------------------------------------------------------------
# 8) Ciclo for sul secondo array
# ------------------------------------------------------------
# Vedrai gli elementi originali + sto, bene, grazie.
for item in "${second_array[@]}" ; do
    echo "item using @ and second array is : $item"
done

# Fine script
