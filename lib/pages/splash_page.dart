import 'package:flutter/material.dart';

import '../theme/mbq_colors.dart';
import 'home_page.dart';

// Halaman pembuka (splash): hanya logo MBQ + instruksi ketuk di bawahnya.
// Modifikasi invert: background biru tua navy, font putih
// (kebalikan dari halaman lain yang ber-background terang).
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // [invert] background default biru tua dari logo, bukan putih/abu
      backgroundColor: mbqNavy,
      body: GestureDetector(
        // "Tekan di mana saja": seluruh layar menjadi area ketuk
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        },
        // [invert] behavior opaque agar ketukan di area kosong pun terbaca
        behavior: HitTestBehavior.opaque,
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // logo MBQ dibungkus kartu putih agar kontras di atas navy
                Container(
                  padding: const EdgeInsets.all(12),
                  child: const Image(
                    image: AssetImage('assets/mbqlogo.png'),
                    width: 200,
                  ),
                ),
                const SizedBox(height: 24),
                // [invert] teks putih di atas background biru tua
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    "Tekan dimana saja untuk lanjut kerjakan quiz",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
