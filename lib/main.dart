// Anggota Kelompok:
// 1. Clarence Felix Suriano (825240006)
// 2. Daniel Revvelien (825240134)
// 3. Rafli Tri Ramadani (825240157)

import 'package:flutter/material.dart';

import 'pages/splash_page.dart';
import 'theme/mbq_colors.dart';

void main() {
  runApp(const MyApp());
}

// Titik masuk aplikasi MBQ: MaterialApp + tema global navy-putih.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MBQ',
      theme: ThemeData(
        // [Outside material]: kembali ke gaya Material 2 supaya AppBar & tombol
        // otomatis berwarna navy-putih (Flutter baru default-nya Material 3)
        useMaterial3: false,
        colorScheme: const ColorScheme.light(primary: mbqNavy),
        scaffoldBackgroundColor: Colors.grey.shade50,
      ),
      // Halaman pertama: SplashPage (logo + "tekan dimana saja"),
      // lalu ketuk untuk masuk ke HomePage.
      home: const SplashPage(),
    );
  }
}
