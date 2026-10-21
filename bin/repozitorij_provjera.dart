// ignore_for_file: avoid_print
import 'dart:async';

import 'package:zadatci_app/repozitorij.dart';

Future<void> main() async {
  // Zadatak 1.
  final repoMjerenje = ZadatakRepozitorij(neuspjeha: 0);

  final sat = Stopwatch()..start();
  await Future.wait([repoMjerenje.dohvati(), repoMjerenje.dohvati()]);
  sat.stop();
  print('Future.wait trajao: ${sat.elapsedMilliseconds} ms');

  // Zadatak 2.
  final repo = ZadatakRepozitorij(neuspjeha: 1);

  for (var pokusaj = 1; pokusaj <= 2; pokusaj++) {
    try {
      print('Pokušaj $pokusaj: dohvaćam...');
      final zadaci = await repo.dohvati().timeout(
        const Duration(milliseconds: 300),
      );

      for (final z in zadaci) {
        print('- ${z.naslov} (${z.zavrsen ? 'gotovo' : 'u tijeku'})');
      }

      break;
    } on TimeoutException {
      print('Isteklo vrijeme');
    } on ZadatciException catch (e) {
      print('Pogreška: ${e.poruka}');
    } finally {
      print('Pokušaj $pokusaj završen');
    }
  }
}
