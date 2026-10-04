import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../pages/statistik_page.dart';
import '../theme/mbq_colors.dart';
import '../widgets/quiz_card.dart';

// Halaman 1: daftar kuis + akses ke halaman Statistik.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MBQ | My Belajar Quiz"),
        actions: [
          // ikon statistik; GestureDetector dipakai (bukan IconButton)
          // agar tetap murni widget materi P1-4
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const StatistikPage()),
              );
            },
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Icon(Icons.bar_chart),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // logo MBQ di atas daftar kuis
              Row(
                children: [
                  const Image(
                    image: AssetImage('assets/mbqlogo.png'),
                    height: 56,
                  ),
                  const SizedBox(width: 12),
                  const Text("Pilih Kuis", style: headingStyle),
                ],
              ),
              const SizedBox(height: 16),
              const SizedBox(height: 16),
              // 3 kartu kuis ditulis manual karena data dummy tetap
              QuizCard(dummyQuizzes[0]),
              const SizedBox(height: 8),
              QuizCard(dummyQuizzes[1]),
              const SizedBox(height: 8),
              QuizCard(dummyQuizzes[2]),
            ],
          ),
        ),
      ),
    );
  }
}
