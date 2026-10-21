### Provjera razumijevanja 1

Polja modela nisu promjenjiva jer koristimo riječ `final`. To znači da se vrijednosti polja ne mogu ponovo dodijeliti nakon kreiranja objekta.
Ako u JSON-u nedostaje polje `naslov`, izraz `json['naslov'] as String` pokušat će pretvoriti vrijednost `null` u tip `String`. Pošto `String` ne dopušta vrijednost `null`, doći će do greške tokom izvršavanja programa (`TypeError`).


### Provjera razumijevanja 2
 
Ako `Future` završi greškom, a mi tu grešku nigdje ne uhvatimo, ona se samo "prenosi" iz jedne funkcije u drugu dok ne stigne do kraja programa. Tamo je nitko ne obradi, pa se ispiše `Unhandled exception` i program se prekine. U Flutteru se greška samo ispiše, ali aplikacija može nastaviti raditi u neispravnom stanju. Zato greške treba hvatati, npr. s `on TimeoutException` i `on ZadatciException`.