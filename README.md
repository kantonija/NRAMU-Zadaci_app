### Provjera razumijevanja 1

Polja modela nisu promjenjiva jer koristimo riječ `final`. To znači da se vrijednosti polja ne mogu ponovo dodijeliti nakon kreiranja objekta.
Ako u JSON-u nedostaje polje `naslov`, izraz `json['naslov'] as String` pokušat će pretvoriti vrijednost `null` u tip `String`. Pošto `String` ne dopušta vrijednost `null`, doći će do greške tokom izvršavanja programa (`TypeError`).