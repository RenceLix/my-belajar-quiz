## 🎓 Informasi Mata Kuliah & Kelompok

Mata Kuliah Mobile Programming (SI34006) 
Program Studi Sistem Informasi 
Universitas Universitas Tarumanagara (UNTAR) 
Anggota 1 [Clarence Felix Suriano - 825240006] 
Anggota 2 [Daniel Revvelien - 825240134] 
Anggota 3 [Rafli Tri Ramadani - 825240157] 
Dosen [Novario Jaya Perdana S.Kom M.T] 

##  Deskripsi Singkat MBQ - My Belajar Quiz

MBQ (My Belajar Quiz) adalah aplikasi kuis interaktif berbasis Flutter (Android) yang membantu dosen, pengajar, dan orang yang membutuhkan pembelajaran untuk membuat kuis untuk dipakai di kelas maupun sebagai latihan mandiri di luar jam kuliah. Aplikasi menyediakan daftar kuis per kategori, halaman pengerjaan soal (pilihan ganda, benar/salah, esai) dengan timer, serta hasil dan statistik kuis sebagai bahan evaluasi pembelajaran.

Fokus UTS ini adalah UI & layout + pemilihan widget yang tepat. Seluruh data bersifat statis (dummy) bertema Quiz Sejarah Umum; fitur tidak harus berjalan penuh, tetapi tombol harus berfungsi (navigasi antar halaman, notifikasi sederhana) dan ada minimal satu animasi sederhana.

## Design

Primary (AppBar, tombol, kartu terpilih) Biru tua navy (warna logo) #1A2B6D
Background kartu Navy muda #E8EAF4
Surface / teks di atas navy Putih #FFFFFF
Background SplashPage Biru tua navy penuh + teks putih
Status "Benar" => Hijau
Status "Salah" => Merah 

SplashPage (halaman pembuka) memakai gaya invert: background-nya justru biru tua navy (mbqNavy) dengan font putih senada dengan badge logo.. sementara halaman lain tetap memakai gaya normal (background terang, teks navy). Logo (assets/mbqlogo.png) ditampilkan di SplashPage dan juga di atas daftar kuis di HomePage.


## Fitur & Halaman

1. Buat kuis dengan 3 tipe soal (pilihan ganda, esai, benar/salah) QuestionPage (tampilan soal per tipe; kuis "Quiz Sejarah Umum" memuat ketiga tipe) UI + interaksi (pilih jawaban via GestureDetector); esai bisa diketik (TextField [Outside material]) 
2. Pengaturan timer kuis QuizDetailPage (info durasi) & QuestionPage (timer countdown berjalan) UI + interaksi (countdown 20 detik per soal via Timer, tanda merah pada 2 detik terakhir) [Outside material: Timer/initState] 
3. Penilaian otomatis pilihan ganda QuizResultPage (skor & jumlah benar/salah) UI + interaksi (perhitungan sederhana dengan loop dari data dummy) 
4. Statistik hasil kuis untuk evaluasi QuizResultPage (ringkasan mini) & StatistikPage (halaman tambahan) UI only 

## Daftar Halaman

1. SplashPage (halaman pembuka) - hanya logo MBQ dan teks "Tekan dimana saja untuk lanjut kerjakan quiz"; menekan di mana saja pada layar masuk ke daftar kuis. Background biru tua-navy dengan teks putih (invert).
2. HomePage (Quiz List) - logo MBQ, daftar kuis beserta kategori, jumlah soal, dan durasi; ikon akses ke Statistik. Halaman wajib.
3. QuizDetailPage - judul, badge kategori, deskripsi, jumlah soal, durasi, dan tombol "Mulai Kuis". Halaman wajib.
4. QuestionPage - teks soal, kartu opsi jawaban (menyesuaikan 3 tipe soal), navigasi soal sebelumnya/berikutnya, dan timer countdown 20 detik per soal (merah + tebal pada 2 detik terakhir). Halaman wajib.
5. QuizResultPage - skor, jumlah benar/salah, ringkasan hasil, dan mini-statistik; tombol kembali ke beranda. Halaman wajib.
6. StatistikPage (halaman tambahan) - rekap nilai per kuis dalam bentuk bar sederhana untuk evaluasi belajar.

Detail teknis tiap halaman (wireframe, widget tree, state): lihat [PROJECTMAP.md](PROJECTMAP.md).

## Data Dummy (Tema: Quiz Sejarah Umum)

Seluruh data dummy bertema Quiz Sejarah Umum (tokoh, tempat, penemuan, dan peristiwa penting dalam sejarah dunia dan Indonesia).

Quiz Sejarah Umum Umum 10 menit 6 soal campuran: 4 pilihan ganda, 1 benar/salah, 1 esai Sejarah Indonesia Indonesia 
5 menit 5 soal benar/salah Sejarah Dunia Dunia 15 menit 3 soal esai

## Cara Menjalankan

flutter doctor      # cek kesiapan lingkungan
flutter pub get     # unduh dependency (tidak ada package eksternal, tapi tetap dijalankan)
flutter run         # jalankan di emulator/perangkat


## Struktur Folder

lib/
├── main.dart          # titik masuk aplikasi + ThemeData (home: SplashPage)
├── theme/             # konstanta warna MBQ (mbqNavy) & gaya teks
├── models/            # class Quiz & Question
├── data/              # data dummy (dummy_data.dart)
├── pages/             # 6 halaman aplikasi (splash + 4 wajib + statistik)
└── widgets/           # komponen reusable (QuizCard, AnswerOptionCard, StatBar)

assets/
└── mbqlogo.png        # logo MBQ (dipakai SplashPage & HomePage)
