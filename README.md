KOP - Úkol 3
============
## TODO pro úkol 3
- ~~GitHub repo~~
- Promyslet a zkusit napojení na generátor
- Promyslet a zkusit napojení na permutátor
- Naskriptovat napojení na generátor
- ~~Měření složitosti pomocí konfigurací~~

## Zadání pro úkol 3

Sledujte:
- Kvalita řešení
- Výpočetní náročnost
- Robustnost

### Kvalita 
= Chyba

Pro instance, kde známe exaktní řešení, se kvalita dá měřit absolutně. Tam, kde srovnáváme heuristiky mezi sebou, můžeme srovnávat pouze relativně. Tyto dva způsoby hodnocení je potřeba rozlišovat a konzistentně mezi nimi volit.

### Výpočetní náročnost
= Počet konfigurací

Jako měřítko výpočetní složitosti použijeme, podobně jako v předchozích úlohách, počet testovaných konfigurací. Poněvadž celkové počty konfigurací instancí lze snadno odvodit, máme měřítko účinnosti dané výpočetní metody.

### Robustnost
= Nemění se při permutacích

Robustnost algoritmu znamená, že sledované parametry (zde tedy kvalita a výpočetní náročnost) nezávisí na zápisu instance. Pro náš problém to znamená nejspíše nezávislost na pořadí věcí, tj. která je označena jako první, která jako druhá.

### Co chtějí?
- Jak reagují solvery na různé parametry generátoru?
- Na základě zjištění navrhněte a proveďte experimentální vyhodnocení kvality řešení a výpočetní náročnosti.

- Prozkoumej robustnost (použitých) solverů.
  - brute
  - bab
  - dynamic (FPTAS pokud se chová jinak)
  - redux

- Prozkoumej závislost náročnosti (u REDUX i rel chybu) na
  - kapacita batohu VS sumární váha
  - korelaci cena/váha
  - rozložení vah + granularita

### Jak zkoumat?
  - zafixuj hodnoty a jednu měň
  - alespoň čtyři hodnoty parametru (měř šest)
  


## Kopáč - Bash skript
Bash skript který pustí Python se vstupním souborem a zkontroluje pomocí programu diff jestli hotové řešení bylo korektní.

## Python skript
Rozdělený do pěti sbouborů.
 - main.py (hlavní spouštění)
 - classes.py (definice užitých tříd)
 - 3*implementace řešení

Jako vstup bere 
- soubor instancí
- jméno výstupního souboru pro konstruované řešení
- jméno výstupního souboru pro uložení spočítaných složitostí
