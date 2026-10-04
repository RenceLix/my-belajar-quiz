// Class Quiz: data satu kuis lengkap dengan daftar soalnya.
import 'question.dart';

class Quiz {
  String title; // judul kuis
  String description; // deskripsi singkat kuis
  String category; // kategori: "Umum" / "Indonesia" / "Dunia"
  int durationMinutes; // durasi pengerjaan dalam menit
  List<Question> questions; // daftar soal

  Quiz(this.title, this.description, this.category, this.durationMinutes,
      this.questions);
}
