// Data dummy MBQ dengan tema Quiz Sejarah Umum: 3 kuis, 3 tipe soal.
import '../models/question.dart';
import '../models/quiz.dart';

// Daftar kuis yang tampil di HomePage
final List<Quiz> dummyQuizzes = [
  // Kuis 1: campuran 3 tipe soal (dipakai untuk demo halaman hasil)
  Quiz(
    "Quiz Sejarah Umum",
    "Uji pengetahuanmu tentang tokoh, tempat, dan peristiwa penting dalam sejarah dunia dan Indonesia.",
    "Umum",
    10,
    [
      Question(
        "Siapa presiden pertama Amerika Serikat?",
        "mc",
        ["Abraham Lincoln", "George Washington", "Thomas Jefferson", "John Adams"],
        1, // kunci: B. George Washington
      ),
      Question(
        "Dimana tembok besar China berada?",
        "mc",
        ["Jepang", "Korea", "Cina", "Mongolia"],
        2, // kunci: C. Cina
      ),
      Question(
        "Siapa penemu lampu pijar?",
        "mc",
        ["Nikola Tesla", "Thomas Alva Edison", "Albert Einstein", "Alexander Graham Bell"],
        1, // kunci: B. Thomas Alva Edison
      ),
      Question(
        "Kapan Indonesia merdeka?",
        "mc",
        ["1940", "1945", "1950", "1965"],
        1, // kunci: B. 1945
      ),
      Question(
        "Candi Borobudur terletak di Jawa Tengah.",
        "tf",
        ["Benar", "Salah"],
        0, // kunci: Benar
      ),
      Question(
        "Jelaskan secara singkat peristiwa Proklamasi Kemerdekaan Indonesia!",
        "essay",
        [], // esai tanpa opsi jawaban
        -1, // esai dinilai manual
      ),
    ],
  ),
  // Kuis 2: semua benar/salah
  Quiz(
    "Sejarah Indonesia",
    "Kuis seputar peristiwa dan tokoh penting dalam sejarah Indonesia.",
    "Indonesia",
    5,
    [
      Question(
        "Proklamasi kemerdekaan Indonesia dibacakan pada 17 Agustus 1945.",
        "tf",
        ["Benar", "Salah"],
        0, // kunci: Benar
      ),
      Question(
        "Mohammad Hatta adalah presiden pertama Indonesia.",
        "tf",
        ["Benar", "Salah"],
        1, // kunci: Salah
      ),
      Question(
        "Soekarno adalah presiden pertama Indonesia.",
        "tf",
        ["Benar", "Salah"],
        0, // kunci: Benar
      ),
      Question(
        "Sumpah Pemuda diikrarkan pada tahun 1928.",
        "tf",
        ["Benar", "Salah"],
        0, // kunci: Benar
      ),
      Question(
        "Indonesia merdeka sebelum tahun 1945.",
        "tf",
        ["Benar", "Salah"],
        1, // kunci: Salah
      ),
    ],
  ),
  // Kuis 3: semua esai (menguji kasus "tidak ada soal yang dinilai otomatis")
  Quiz(
    "Sejarah Dunia",
    "Kuis esai tentang peristiwa besar yang mengubah dunia.",
    "Dunia",
    15,
    [
      Question(
        "Jelaskan penyebab terjadinya Perang Dunia II secara singkat!",
        "essay",
        [],
        -1,
      ),
      Question(
        "Jelaskan latar belakang terjadinya Revolusi Industri!",
        "essay",
        [],
        -1,
      ),
      Question(
        "Jelaskan peran Indonesia dalam Konferensi Asia-Afrika tahun 1955!",
        "essay",
        [],
        -1,
      ),
    ],
  ),
];
