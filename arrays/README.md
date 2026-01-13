# Bash Arrays: `[@]` vs `[*]` (e perché ti fregano)

Questo mini-esercizio mostra come funzionano gli **array in Bash**, e soprattutto la differenza (fondamentale) tra:

- `"${array[@]}"`
- `"${array[*]}"`

Sembra una sciocchezza… finché non ti esplode uno script in produzione perché una stringa con spazi viene “spezzata” in pezzi.

---

## File

- `array.sh` → script di esempio con output e cicli `for`

---

## Come eseguire

```bash
chmod +x array.sh
./array.sh
