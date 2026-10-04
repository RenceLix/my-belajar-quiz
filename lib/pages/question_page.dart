import 'dart:async'; // [Outside material] Timer untuk countdown per soal

import 'package:flutter/material.dart';

import '../models/question.dart';
import '../models/quiz.dart';
import '../pages/quiz_result_page.dart';
import '../theme/mbq_colors.dart';
import '../widgets/answer_option_card.dart';

// huruf opsi A-D untuk label kartu jawaban (ditambahkan di UI, tidak di data)
const List<String> optionLetters = ["A", "B", "C", "D"];

// Halaman 3: pengerjaan soal (inti aplikasi, paling kompleks).
// State: soal aktif (_currentIndex), jawaban user (_answers),
// dan sisa waktu soal (_remainingSeconds).
class QuestionPage extends StatefulWidget {
  final Quiz quiz;

  const QuestionPage(this.quiz, {super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  int _currentIndex = 0; // index soal yang sedang dikerjakan

  // jawaban user: kunci = index soal, nilai = index opsi yang dipilih.
  // Map kosong dipakai karena List berukuran soal butuh initState (belum diajarkan).
  final Map<int, int> _answers = {};

  // controller TextField jawaban esai, satu per soal (kunci = index soal).
  // Dibuat sekali per soal supaya teks tetap tersimpan saat pindah soal
  // dan tidak ter-reset oleh setState timer tiap detik.
  final Map<int, TextEditingController> _essayControllers = {};

  // waktu per soal; tanda "hampir habis" (merah) pada 2 detik terakhir,
  // yaitu detik ke-19 dan ke-20 dari hitungan 20 detik per soal
  static const int _secondsPerQuestion = 20;
  int _remainingSeconds = _secondsPerQuestion;
  Timer? _timer; // [Outside material] Timer dari dart:async

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel(); // hentikan timer saat halaman ditutup
    // bebaskan semua controller TextField esai
    for (final TextEditingController c in _essayControllers.values) {
      c.dispose();
    }
    super.dispose();
  }

  // [Outside material] Timer.periodic (dart:async): kurangi sisa waktu 1 tiap
  // detik, berhenti sendiri saat mencapai 0. Dipanggil juga saat ganti soal
  // supaya tiap soal selalu mendapat 20 detik penuh.
  void _startTimer() {
    _timer?.cancel();
    _remainingSeconds = _secondsPerQuestion;
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      setState(() {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
        }
      });
      if (_remainingSeconds == 0) {
        t.cancel(); // waktu habis: timer berhenti (jawaban tetap boleh dipilih)
      }
    });
  }

  // pindah soal; timer di-reset ke 20 detik, tampilkan notifikasi bila
  // soal tujuan adalah esai
  void _changeQuestion(int newIndex) {
    setState(() {
      _currentIndex = newIndex;
      _startTimer(); // soal baru selalu mulai dari 20 detik lagi
    });
    // [Outside material] SnackBar: notifikasi ringan saat membuka soal esai
    if (widget.quiz.questions[_currentIndex].type == "essay") {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Esai tidak dinilai otomatis")),
      );
    }
  }

  // satu kartu opsi jawaban: GestureDetector (pemilik state) membungkus kartu tampilan
  Widget _buildOptionCard(Question question, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _answers[_currentIndex] = index; // simpan pilihan user untuk soal ini
        });
      },
      child: AnswerOptionCard(
        "${optionLetters[index]}. ${question.options[index]}",
        _answers[_currentIndex] == index, // kartu ini terpilih?
      ),
    );
  }

  // input jawaban esai.
  // [Outside material] TextField + TextEditingController = widget input
  // P5-P6, dipakai agar esai benar-benar bisa diketik/diisi user.
  Widget _buildEssayInput() {
    // controller diambil (atau dibuat) sekali per soal sehingga teks
    // tidak hilang saat pindah soal maju/mundur
    final TextEditingController controller = _essayControllers.putIfAbsent(
      _currentIndex,
      () => TextEditingController(),
    );
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TextField: esai tidak dinilai otomatis, cukup disimpan di controller
          TextField(
            controller: controller,
            maxLines: 8,
            decoration: const InputDecoration(
              hintText: "Tulis jawaban esai di sini...",
              border: InputBorder.none,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Input teks",
            style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }

  // susun area jawaban sesuai tipe soal: esai / benar-salah / pilihan ganda
  Widget _buildAnswerArea(Question question) {
    if (question.type == "essay") {
      return _buildEssayInput();
    } else if (question.type == "tf") {
      // benar/salah: 2 kartu opsi (ditulis manual karena dummy tetap)
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(child: _buildOptionCard(question, 0)),
          const SizedBox(height: 8),
          Flexible(child: _buildOptionCard(question, 1)),
        ],
      );
    } else {
      // pilihan ganda: 4 kartu opsi (ditulis manual karena dummy tetap)
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(child: _buildOptionCard(question, 0)),
          const SizedBox(height: 8),
          Flexible(child: _buildOptionCard(question, 1)),
          const SizedBox(height: 8),
          Flexible(child: _buildOptionCard(question, 2)),
          const SizedBox(height: 8),
          Flexible(child: _buildOptionCard(question, 3)),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // ambil sekali di awal build agar kode di bawah lebih ringkas
    final Quiz quiz = widget.quiz;
    final Question question = quiz.questions[_currentIndex];
    bool isLastQuestion = _currentIndex == quiz.questions.length - 1;
    // tanda "waktu hampir habis": benar saat 2 detik terakhir (detik ke-19 & ke-20)
    bool timeAlmostUp = _remainingSeconds <= 2;

    return Scaffold(
      appBar: AppBar(
        title: Text("Soal ${_currentIndex + 1} dari ${quiz.questions.length}"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // timer countdown per soal, rata kanan agar hemat tinggi layar.
              // Tanda 2 detik terakhir: ikon & angka berubah merah + tebal
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: timeAlmostUp ? Colors.red.shade50 : mbqNavyLight,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.timer,
                        size: 16,
                        color: timeAlmostUp ? Colors.red : mbqNavy,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "$_remainingSeconds detik",
                        style: TextStyle(
                          // tanda merah saat detik ke-19 & ke-20 (sisa 2 detik)
                          color: timeAlmostUp ? Colors.red : Colors.black,
                          fontWeight: timeAlmostUp
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              // kartu teks soal
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(question.questionText, style: questionStyle),
              ),
              const SizedBox(height: 16),
              // area jawaban (esai / benar-salah / pilihan ganda) mengisi sisa ruang
              Expanded(child: _buildAnswerArea(question)),
              const SizedBox(height: 16),
              // navigasi antar soal
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    // nonaktif (onPressed null) di soal pertama
                    onPressed: _currentIndex == 0
                        ? null
                        : () {
                            _changeQuestion(_currentIndex - 1);
                          },
                    child: const Text("Sebelumnya"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (isLastQuestion) {
                        // soal terakhir: buka halaman hasil + kirim jawaban
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                QuizResultPage(quiz, _answers),
                          ),
                        );
                      } else {
                        _changeQuestion(_currentIndex + 1);
                      }
                    },
                    // label berubah jadi "Selesai" di soal terakhir
                    child: Text(isLastQuestion ? "Selesai" : "Berikutnya"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
