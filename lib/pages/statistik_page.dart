import 'package:flutter/material.dart';

import '../theme/mbq_colors.dart';
import '../widgets/stat_bar.dart';

// Halaman tambahan: rekap nilai per kuis untuk evaluasi belajar.
class StatistikPage extends StatelessWidget {
  const StatistikPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Statistik Belajar")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Rata-rata nilai per kuis", style: headingStyle),
              const SizedBox(height: 16),
              // nilai dummy di rentang 1-99 agar flex bar tidak bernilai 0
              const StatBar("Umum", 80),
              const SizedBox(height: 8),
              const StatBar("Indonesia", 50),
              const SizedBox(height: 8),
              const StatBar("Dunia", 40),
              const SizedBox(height: 16),
              const Text("Total kuis dikerjakan : 12"),
              const SizedBox(height: 4),
              const Text("Total jawaban benar   : 38"),
            ],
          ),
        ),
      ),
    );
  }
}
