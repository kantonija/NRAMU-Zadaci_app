## Student: Antonija Kožul

## Verzije
 
- Dart: 3.13.5
- Flutter: 3.47.7

OS: Windows, za pokretanje aplikacije korišten Android Studio.

### Provjera razumijevanja 1

Polja modela nisu promjenjiva jer koristimo riječ `final`. To znači da se vrijednosti polja ne mogu ponovo dodijeliti nakon kreiranja objekta.
Ako u JSON-u nedostaje polje `naslov`, izraz `json['naslov'] as String` pokušat će pretvoriti vrijednost `null` u tip `String`. Pošto `String` ne dopušta vrijednost `null`, doći će do greške tokom izvršavanja programa (`TypeError`).


### Provjera razumijevanja 2
 
Ako `Future` završi greškom, a mi tu grešku nigdje ne uhvatimo, ona se samo "prenosi" iz jedne funkcije u drugu dok ne stigne do kraja programa. Tamo je nitko ne obradi, pa se ispiše `Unhandled exception` i program se prekine. U Flutteru se greška samo ispiše, ali aplikacija može nastaviti raditi u neispravnom stanju. Zato greške treba hvatati, npr. s `on TimeoutException` i `on ZadatciException`.


### Provjera razumijevanja 3
 
Future se stvara u polju jer Flutter poziva `build` puno puta (npr. kod svakog `setState`), pa bi se dohvat svaki put pokrenuo ispočetka i opet bi se pojavio spinner. U polju se dohvat pokrene samo jednom, a novi samo kad to namjerno zatražimo. Svaki zaslon s podacima mora prikazati tri stanja: učitavanje (spinner), grešku (poruka i gumb za ponovni pokušaj) i prazan popis (poruka "Nema zadataka").
 