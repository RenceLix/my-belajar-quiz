import 'package:flutter/material.dart';

import '../theme/mbq_colors.dart';

// Kartu tampilan satu opsi jawaban.
// Tidak ada GestureDetector di sini; pembungkusnya dipasang di QuestionPage
// (pemilik state) karena widget reusable ini hanya tampilan.
class AnswerOptionCard extends StatelessWidget {
  final String text; // teks opsi, sudah termasuk huruf "A. " dst.
  final bool isSelected; // apakah opsi ini sedang dipilih user

  const AnswerOptionCard(this.text, this.isSelected, {super.key});

  @override
  Widget build(BuildContext context) {
    // AnimatedContainer: di luar materi P1-4, dipakai untuk kriteria animasi sederhana
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        // kartu terpilih: navy muda + border navy; biasa: putih + border abu
        color: isSelected ? mbqNavyLight : Colors.white,
        border: Border.all(
          color: isSelected ? mbqNavy : Colors.grey.shade300,
          width: isSelected ? 2 : 1,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(child: Text(text)),
          // ikon centang hanya tampil pada kartu terpilih
          isSelected
              ? const Icon(Icons.check_circle, color: mbqNavy)
              : const SizedBox(),
        ],
      ),
    );
  }
}
