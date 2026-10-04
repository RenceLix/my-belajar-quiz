// Class Question: data satu soal kuis.
// type = "mc" (pilihan ganda) / "tf" (benar-salah) / "essay";
// esai tidak dinilai otomatis, jadi correctIndex-nya -1.
class Question {
  String questionText; // teks soal
  String type; // "mc" / "tf" / "essay"
  List<String> options; // opsi jawaban; [] untuk esai, ["Benar", "Salah"] untuk tf
  int correctIndex; // index kunci jawaban; -1 untuk esai

  Question(this.questionText, this.type, this.options, this.correctIndex);
}
