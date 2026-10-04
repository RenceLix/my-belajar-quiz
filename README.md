##  Deskripsi Singkat MBQ — My Belajar Quiz

MBQ (My Belajar Quiz) adalah aplikasi kuis interaktif berbasis Flutter (Android) yang membantu dosen, pengajar, dan orang yang membutuhkan pembelajaran untuk membuat kuis untuk dipakai di kelas maupun sebagai latihan mandiri di luar jam kuliah. Aplikasi menyediakan daftar kuis per kategori, halaman pengerjaan soal (pilihan ganda, benar/salah, esai) dengan timer, serta hasil dan statistik kuis sebagai bahan evaluasi pembelajaran.

> Fokus UTS ini adalah **UI & layout + pemilihan widget yang tepat**. Seluruh data bersifat statis (dummy) bertema **Quiz Sejarah Umum**; fitur tidak harus berjalan penuh, tetapi **tombol harus berfungsi** (navigasi antar halaman, notifikasi sederhana) dan ada **minimal satu animasi sederhana**.

## 🎨 Identitas Visual

Warna MBQ diambil dari logo (badge biru tua–putih): **biru tua navy** sebagai warna utama dan **putih** sebagai permukaan.

| Peran | Warna | Hex |
|---|---|---|
| Primary (AppBar, tombol, kartu terpilih) | 🔵 Biru tua navy (warna logo) | `#1A2B6D` |
| Background kartu (hero card, lingkaran skor) | 🔵 Navy muda | `#E8EAF4` |
| Surface / teks di atas navy | ⚪ Putih | `#FFFFFF` |
| Background SplashPage (invert) | 🔵 Biru tua navy penuh + teks putih | `#1A2B6D` |
| Status "Benar" (fungsional) | 🟢 Hijau | `Colors.green` |
| Status "Salah" (fungsional) | 🔴 Merah | `Colors.red` |

**SplashPage (halaman pembuka) memakai gaya invert**: background-nya justru biru tua navy (`mbqNavy`) dengan font putih — senada dengan badge logo — sementara halaman lain tetap memakai gaya normal (background terang, teks navy). Logo (`assets/mbqlogo.png`) ditampilkan di SplashPage dan juga di atas daftar kuis di HomePage.

Warna dan gaya teks dipusatkan di `lib/theme/mbq_colors.dart` (`mbqNavy`, `mbqNavyLight`, `headingStyle`, `questionStyle`). Tema global memakai `useMaterial3: false` agar AppBar dan tombol otomatis berwarna navy-putih (Flutter terbaru memakai Material 3 sebagai default) — rincian di [PROJECTMAP.md](PROJECTMAP.md).

## 🎓 Informasi Mata Kuliah & Kelompok

| Item | Keterangan |
|---|---|
| Mata Kuliah | Mobile Programming (SI34006) |
| Program Studi | Sistem Informasi |
| Universitas | Universitas Tarumanagara (UNTAR) |
| Anggota 1 | [Nama 1 – NIM 1] |
| Anggota 2 | [Nama 2 – NIM 2] |
| Anggota 3 | [Nama 3 – NIM 3] |
| Dosen | [FILL IN] |

## ✨ Fitur & Halaman

| Fitur | Muncul di Halaman | Status |
|---|---|---|
| 1. Buat kuis dengan 3 tipe soal (pilihan ganda, esai, benar/salah) | QuestionPage (tampilan soal per tipe; kuis "Quiz Sejarah Umum" memuat ketiga tipe) | UI + interaksi (pilih jawaban via `GestureDetector`); esai bisa diketik (`TextField` [Outside material]) |
| 2. Pengaturan timer kuis | QuizDetailPage (info durasi) & QuestionPage (timer countdown berjalan) | UI + interaksi (countdown 20 detik per soal via `Timer`, tanda merah pada 2 detik terakhir) [Outside material: `Timer`/`initState`] |
| 3. Penilaian otomatis pilihan ganda | QuizResultPage (skor & jumlah benar/salah) | UI + interaksi (perhitungan sederhana dengan loop dari data dummy) |
| 4. Statistik hasil kuis untuk evaluasi | QuizResultPage (ringkasan mini) & StatistikPage *(halaman tambahan)* | UI only |

## 📄 Daftar Halaman

1. **SplashPage** *(halaman pembuka)* — hanya logo MBQ dan teks "Tekan dimana saja untuk lanjut kerjakan quiz"; menekan di mana saja pada layar masuk ke daftar kuis. Background biru tua-navy dengan teks putih (invert).
2. **HomePage** (Quiz List) — logo MBQ, daftar kuis beserta kategori, jumlah soal, dan durasi; ikon akses ke Statistik. *Halaman wajib.*
3. **QuizDetailPage** — judul, badge kategori, deskripsi, jumlah soal, durasi, dan tombol "Mulai Kuis". *Halaman wajib.*
4. **QuestionPage** — teks soal, kartu opsi jawaban (menyesuaikan 3 tipe soal), navigasi soal sebelumnya/berikutnya, dan timer countdown 20 detik per soal (merah + tebal pada 2 detik terakhir). *Halaman wajib.*
5. **QuizResultPage** — skor, jumlah benar/salah, ringkasan hasil, dan mini-statistik; tombol kembali ke beranda. *Halaman wajib.*
6. **StatistikPage** *(halaman tambahan)* — rekap nilai per kuis dalam bentuk bar sederhana untuk evaluasi belajar.

Detail teknis tiap halaman (wireframe, widget tree, state): lihat [PROJECTMAP.md](PROJECTMAP.md).

## 🗂 Data Dummy (Tema: Quiz Sejarah Umum)

Seluruh data dummy bertema **Quiz Sejarah Umum** (tokoh, tempat, penemuan, dan peristiwa penting dalam sejarah dunia dan Indonesia).

| Kuis | Kategori | Durasi | Soal |
|---|---|---|---|
| Quiz Sejarah Umum | Umum | 10 menit | 6 soal campuran: 4 pilihan ganda, 1 benar/salah, 1 esai |
| Sejarah Indonesia | Indonesia | 5 menit | 5 soal benar/salah |
| Sejarah Dunia | Dunia | 15 menit | 3 soal esai |

Contoh soal pilihan ganda (✅ = kunci jawaban):

1. Siapa presiden pertama Amerika Serikat? — a) Abraham Lincoln, b) George Washington ✅, c) Thomas Jefferson, d) John Adams
2. Dimana tembok besar China berada? — a) Jepang, b) Korea, c) Cina ✅, d) Mongolia
3. Siapa penemu lampu pijar? — a) Nikola Tesla, b) Thomas Alva Edison ✅, c) Albert Einstein, d) Alexander Graham Bell
4. Kapan Indonesia merdeka? — a) 1940, b) 1945 ✅, c) 1950, d) 1965

Daftar lengkap soal dan model datanya ada di [PROJECTMAP.md](PROJECTMAP.md) (Bab 3).

## 🛠 Teknologi & Prasyarat

Sesuai materi Pertemuan 1–4 (tanpa package eksternal):

| Komponen | Versi/Ketentuan |
|---|---|
| Flutter SDK | Versi stabil (di-install di `C:/dev/`) |
| Dart | Bawaan Flutter SDK |
| Android Studio | IDE resmi + plugin Flutter & Dart |
| Android Virtual Device (AVD) | Emulator untuk pengujian (uji juga di ukuran layar kecil) |
| JDK | Minimal versi 11 |

## ▶️ Cara Menjalankan

```bash
flutter doctor      # cek kesiapan lingkungan
flutter pub get     # unduh dependency (tidak ada package eksternal, tapi tetap dijalankan)
flutter run         # jalankan di emulator/perangkat
```

## 📁 Struktur Folder (Ringkas)

```
lib/
├── main.dart          # titik masuk aplikasi + ThemeData (home: SplashPage)
├── theme/             # konstanta warna MBQ (mbqNavy) & gaya teks
├── models/            # class Quiz & Question
├── data/              # data dummy (dummy_data.dart)
├── pages/             # 6 halaman aplikasi (splash + 4 wajib + statistik)
└── widgets/           # komponen reusable (QuizCard, AnswerOptionCard, StatBar)

assets/
└── mbqlogo.png        # logo MBQ (dipakai SplashPage & HomePage)
```

Struktur lengkap + penjelasan tiap file: lihat [PROJECTMAP.md](PROJECTMAP.md).

## 📚 Batasan Materi (Pertemuan 1–4)

- **M1 (Introduction):** `MaterialApp`, `Scaffold`, `AppBar`, `Text`, `Icon`, `ElevatedButton`, `StatelessWidget`/`StatefulWidget`, `setState`, dasar Dart (class, constructor, method, `final`/`const`, `if`, `for`, ternary).
- **M2 (Layout):** `Container` + `BoxDecoration`, `Padding`, `Center`, `Align`, `Row`, `Column`, `mainAxisAlignment`/`crossAxisAlignment`, konsep constraints.
- **M3 (Advanced Layout):** `SizedBox`, `Expanded`, `Flexible`, `Spacer`, `Stack`, `Positioned`, `MediaQuery`, `SafeArea`, `Theme`.
- **M4 (Gestures & State):** `GestureDetector` (`onTap`), state & `setState()`, interactive UI, `Navigator.push(MaterialPageRoute)` / `Navigator.pop`.

**Tidak dipakai:** state management lanjutan, database, API/HTTP, package eksternal, named routes, `ListView`/`SingleChildScrollView`, widget input P5–P6 (`Checkbox`, `Radio`, `Switch`, `Dropdown`, Picker). *Pengecualian: `TextField` dipakai khusus untuk input jawaban esai di QuestionPage — [Outside material], teksnya tidak dinilai otomatis.*

**Di luar materi (diberi label [Outside material] di kode & PROJECTMAP.md):** `AnimatedContainer` (animasi kartu jawaban), `SnackBar` (notifikasi), `Timer` dart:async + `initState`/`dispose` (countdown 20 detik per soal di QuestionPage), `TextField` + `TextEditingController` (input jawaban esai di QuestionPage), `useMaterial3: false` + `ColorScheme.light` (tema), `automaticallyImplyLeading` (AppBar halaman hasil), `Image.asset`/`AssetImage` + registrasi `assets:` di `pubspec.yaml` (menampilkan logo MBQ di SplashPage & HomePage), `HitTestBehavior.opaque` (area ketuk splash mencakup seluruh layar).

**Perlu verifikasi dosen:** `widget.quiz` di class State, `Map<int, int>` untuk menyimpan jawaban, penulisan warna `Color(0xFF…)`, dan apakah perubahan visual via `setState` dihitung sebagai "animasi" bila `AnimatedContainer` tidak diizinkan.

## ✅ Checklist Kriteria Penilaian

- [ ] Minimal 4 halaman UI (tercapai: 6 halaman)
- [ ] Layout rapi tanpa overflow (uji di AVD kecil & besar), pemilihan widget sesuai konsep layout
- [ ] Tombol berfungsi (navigasi antar halaman, notifikasi); "Kembali ke Beranda" dari hasil sampai ke HomePage
- [ ] Minimal 1 animasi sederhana
- [ ] Menggunakan dummy data (tanpa database); skor benar untuk kuis campuran dan kuis esai-semua tidak error
- [ ] Sesuai materi Pertemuan 1–4 (di luar materi diberi label)
- [ ] `main.dart` + file pendukung siap dikumpulkan
- [ ] Screenshot semua halaman terlampir

## 👥 Pembagian Tugas (Ringkas)

| Anggota | Bagian |
|---|---|
| Anggota 1 | `main.dart`, theme, models, dummy data, SplashPage + `assets/mbqlogo.png`, HomePage + `quiz_card.dart`, StatistikPage + `stat_bar.dart` |
| Anggota 2 | QuizDetailPage, QuestionPage + `answer_option_card.dart` |
| Anggota 3 | QuizResultPage (logika skor), animasi & finishing, pengecekan overflow, screenshot & dokumentasi |

Rincian integrasi & pembagian per komponen: lihat [PROJECTMAP.md](PROJECTMAP.md).

## 📸 Screenshot

Enam halaman, tujuh gambar (QuestionPage punya dua varian).

| No | Halaman | Screenshot |
|---|---|---|
| 1 | SplashPage (halaman pembuka, invert) | *[tambahkan gambar]* |
| 2 | HomePage (Quiz List) | *[tambahkan gambar di folder `screenshots/`]* |
| 3 | QuizDetailPage | *[tambahkan gambar]* |
| 4 | QuestionPage (pilihan ganda) | *[tambahkan gambar]* |
| 5 | QuestionPage (benar/salah & esai) | *[tambahkan gambar]* |
| 6 | QuizResultPage | *[tambahkan gambar]* |
| 7 | StatistikPage *(tambahan)* | *[tambahkan gambar]* |
