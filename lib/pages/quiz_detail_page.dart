import 'package:flutter/material.dart';

import '../models/quiz.dart';
import '../pages/question_page.dart';
import '../theme/mbq_colors.dart';

// Halaman 2: detail kuis + tombol "Mulai Kuis".
class QuizDetailPage extends StatelessWidget {
  final Quiz quiz;

  const QuizDetailPage(this.quiz, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail Kuis")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // kartu hero: ikon + judul + badge kategori
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: mbqNavyLight,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Stack(
                  children: [
                    // child utama dilebarkan agar Stack memenuhi kartu,
                    // sehingga badge bisa menempel di tepi kanan
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.quiz, color: mbqNavy, size: 32),
                          const SizedBox(height: 8),
                          Text(quiz.title, style: questionStyle),
                        ],
                      ),
                    ),
                    // badge kategori menempel di pojok kanan atas kartu
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: mbqNavy,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          quiz.category,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Text("Deskripsi", style: headingStyle),
              const SizedBox(height: 8),
              Text(quiz.description),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Flexible: dua kotak info berbagi ruang tanpa overflow
                  Flexible(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.list_alt, color: mbqNavy, size: 20),
                          const SizedBox(width: 8),
                          Text("${quiz.questions.length} soal"),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.timer, color: mbqNavy, size: 20),
                          const SizedBox(width: 8),
                          Text("${quiz.durationMinutes} menit"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              // Spacer mendorong tombol menempel di bawah halaman
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  // mulai kuis: buka halaman soal sambil mengirim data kuis
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QuestionPage(quiz)),
                  );
                },
                child: const Text("Mulai Kuis"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
