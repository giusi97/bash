# filtra_descrivi

Script Bash che legge un file di testo riga per riga, stampa solo le righe **non vuote** e alla fine mostra un piccolo report:

- quante righe vuote (incluse righe con soli spazi/tab)
- quante righe non vuote

Gestisce anche file creati su Windows (CRLF), rimuovendo l’eventuale `\r` a fine riga.

## Requisiti

- Bash (Linux / WSL / macOS)
- Un file di input (es. lista di nomi)

## Installazione

Rendi eseguibile lo script:

```bash
chmod +x filtra_descrivi.sh
