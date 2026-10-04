import 'package:flutter/material.dart';

import '../models/quiz.dart';
import '../theme/mbq_colors.dart';

// Halaman 4: hasil kuis (skor, benar/salah, ringkasan per tipe soal).
class QuizResultPage extends StatelessWidget {
  final Quiz quiz;
  final Map<int, int> answers; // kunci = index soal, nilai = index opsi dipilih

  const QuizResultPage(this.quiz, this.answers, {super.key});

  @override
  Widget build(BuildContext context) {
    // hitung skor: hanya soal mc/tf yang dinilai otomatis
    int mcCorrect = 0;
    int mcTotal = 0;
    int tfCorrect = 0;
    int tfTotal = 0;
    for (int i = 0; i < quiz.questions.length; i++) {
      if (quiz.questions[i].type == "mc") {
        mcTotal++;
        if (answers[i] == quiz.questions[i].correctIndex) mcCorrect++;
      } else if (quiz.questions[i].type == "tf") {
        tfTotal++;
        if (answers[i] == quiz.questions[i].correctIndex) tfCorrect++;
      }
    }
    int graded = mcTotal + tfTotal; // jumlah soal yang dinilai otomatis
    int correct = mcCorrect + tfCorrect;
    // cegah pembagian nol saat semua soal esai (0/0 = NaN, .round() error)
    int score = graded == 0 ? 0 : ((correct / graded) * 100).round();
    // tampilkan "-" bila tidak ada soal yang dinilai otomatis
    String scoreText = graded == 0 ? "-" : "$score";

    // diameter lingkaran skor proporsional terhadap lebar layar
    double circleSize = MediaQuery.of(context).size.width * 0.35;

    // catatan khusus untuk kuis yang soalnya esai semua
    Widget essayNote = graded == 0
        ? Text(
            "Semua soal esai dinilai manual",
            style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
          )
        : const SizedBox();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Hasil Kuis"),
        // [Outside material]: sembunyikan panah back otomatis agar alur
        // selalu lewat tombol "Kembali ke Beranda"
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // lingkaran skor (position M3: teks bertumpuk di atas lingkaran)
                    Container(
                      width: circleSize,
                      height: circleSize,
                      decoration: const BoxDecoration(
                        color: mbqNavyLight,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          scoreText,
                          style: const TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: mbqNavy,
                          ),
                        ),
                        const Text("NILAI"),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Center(child: Text("Kuis ${quiz.title} selesai!")),
              const SizedBox(height: 8),
              essayNote,
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // kartu jumlah jawaban benar
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.check_circle, color: Colors.green),
                        const SizedBox(height: 8),
                        Text("Benar: $correct"),
                      ],
                    ),
                  ),
                  // kartu jumlah jawaban salah
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.cancel, color: Colors.red),
                        const SizedBox(height: 8),
                        Text("Salah: ${graded - correct}"),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // kartu mini-statistik per tipe soal
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Ringkasan", style: headingStyle),
                    const SizedBox(height: 8),
                    Text("Pilihan ganda : $mcCorrect/$mcTotal benar"),
                    const SizedBox(height: 4),
                    Text("Benar/Salah   : $tfCorrect/$tfTotal benar"),
                    const SizedBox(height: 4),
                    const Text("Esai          : dinilai manual"),
                  ],
                ),
              ),
              // Spacer mendorong tombol ke bawah halaman
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  // pop Result, Question, lalu Detail → sampai di Home
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: const Text("Kembali ke Beranda"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
