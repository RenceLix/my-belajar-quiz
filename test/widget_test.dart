// Smoke test sederhana: alur splash → halaman utama MBQ dengan 3 kartu kuis.
import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';

import 'package:uts/main.dart';

void main() {
  testWidgets('Splash lalu halaman utama menampilkan judul MBQ dan 3 kartu kuis',
      (tester) async {
    // bangun aplikasi dan render satu frame
    await tester.pumpWidget(const MyApp());

    // halaman pertama adalah splash: logo + instruksi ketuk
    expect(
        find.text('Tekan dimana saja untuk lanjut kerjakan quiz'),
        findsOneWidget);

    // ketuk di mana saja (GestureDetector splash) untuk lanjut ke HomePage
    await tester.tap(find.byType(GestureDetector).first);
    await tester.pumpAndSettle();

    // AppBar dan judul section tampil
    expect(find.text('MBQ | My Belajar Quiz'), findsOneWidget);
    expect(find.text('Pilih Kuis'), findsOneWidget);

    // ketiga kartu kuis dummy tampil
    expect(find.text('Quiz Sejarah Umum'), findsOneWidget);
    expect(find.text('Sejarah Indonesia'), findsOneWidget);
    expect(find.text('Sejarah Dunia'), findsOneWidget);
  });
}
