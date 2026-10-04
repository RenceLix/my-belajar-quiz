import 'package:flutter/material.dart';

import '../models/quiz.dart';
import '../pages/quiz_detail_page.dart';
import '../theme/mbq_colors.dart';

// Kartu kuis di HomePage; di dalamnya ada GestureDetector untuk pindah ke detail.
class QuizCard extends StatelessWidget {
  final Quiz quiz;

  const QuizCard(this.quiz, {super.key});

  // pilih ikon sesuai kategori kuis
  IconData _categoryIcon() {
    if (quiz.category == "Indonesia") {
      return Icons.history_edu;
    } else if (quiz.category == "Dunia") {
      return Icons.public;
    } else {
      return Icons.account_balance;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // pindah ke halaman detail sambil mengirim data kuis lewat constructor
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => QuizDetailPage(quiz)),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            // kotak ikon kategori
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: mbqNavyLight,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(_categoryIcon(), color: mbqNavy),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(quiz.title, style: questionStyle),
                  const SizedBox(height: 4),
                  Text("${quiz.category} • ${quiz.questions.length} soal"),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.timer, size: 16),
                      const SizedBox(width: 4),
                      Text("${quiz.durationMinutes} menit"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
