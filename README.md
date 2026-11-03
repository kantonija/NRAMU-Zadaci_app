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
 

### Vjezba 03

Bolje je zadati boju u temi nego na svakom widgetu zbog lakšeg održavanja, dosljednosti dizajna, boja i widgeta, boljoj podršci za Dark Mode te najbitnije, čistiji i čitljivi kod.

U ovom kodu spremanje zatvara zaslon s `Navigator.pop(context, zadatak)`, pa `push` vrati spremljeni `Zadatak`. Odabir „Odustani” zatvara zaslon bez vrijednosti, pa rezultat bude `null`.

### Provjera razumijevanja 1

`validate()` provjerava sva polja unutar forme pozivajući funkcije `validator`. Vraća `true` ako su sva polja ispravna, a `false` ako barem jedno polje nije ispravno. Kad je unos ispravan, vraća `null` jer nema poruke o pogrešci koju treba prikazati.

### Provjera razumijevanja 2

Nakon `await Navigator.push(...)` provjerava se `mounted` jer se tijekom čekanja korisnik mogao udaljiti sa zaslona koji je otvorio obrazac. Ako se to dogodilo, njegov `State` više nije aktivan i ne smije se pozivati `setState` niti koristiti njegov `context`. Uvjet `if (!mounted || novi == null) return;` ujedno prekida obradu ako je korisnik odustao i nije vraćen zadatak.