class DoaTidurModel {
  final String title;
  final String arabic;
  final String latin;
  final String translation;
  final String source; // Tambahan field untuk sumber hadits

  DoaTidurModel({
    required this.title,
    required this.arabic,
    required this.latin,
    required this.translation,
    required this.source,
  });
}

// 1. DATA DOA SEBELUM & SESUDAH TIDUR
final List<DoaTidurModel> dataDoaTidur = [
  DoaTidurModel(
    title: 'Doa Sebelum Tidur',
    arabic: 'بِاسْمِكَ اللَّهُمَّ أَمُوتُ وَأَحْيَا',
    latin: 'Bismikallahumma amuutu wa ahyaa.',
    translation: '"Dengan menyebut nama-Mu, Ya Allah, aku mati dan aku hidup."',
    source: 'HR. Bukhari no. 6320 & Muslim no. 2711',
  ),
  DoaTidurModel(
    title: 'Doa Bangun Tidur',
    arabic: 'الْحَمْدُ لِلَّهِ الَّذِي أَحْيَانَا بَعْدَ مَا أَمَاتَنَا وَإِلَيْهِ النُّشُورُ',
    latin: 'Alhamdulillahilladzi ahyaanaa ba\'damaa amaatanaa wa ilayhin nusyuur.',
    translation: '"Segala puji bagi Allah yang telah menghidupkan kami setelah mematikan kami, dan kepada-Nya lah kebangkitan."',
    source: 'HR. Bukhari no. 6312',
  ),
];

// 2. DATA TUTORIAL & DZIKIR TIDUR
final List<DoaTidurModel> dataDzikirTidur = [
  DoaTidurModel(
    title: '1. Meniup Tangan & Membaca 3 Qul',
    arabic: 'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ (قُلْ هُوَ اللَّهُ أَحَدٌ...) وَالْفَلَقِ وَالنَّاسِ',
    latin: 'Membaca Al-Ikhlas, Al-Falaq, An-Nas, tiup ke telapak tangan, lalu usap ke tubuh yang terjangkau (Diulang 3x).',
    translation: '"Nabi SAW merapatkan kedua telapak tangannya, meniupnya dan membaca Al-Ikhlas, Al-Falaq, An-Nas, lalu mengusapkan ke tubuh dimulai dari kepala, wajah, dan tubuh bagian depan."',
    source: 'HR. Bukhari no. 5017',
  ),
  DoaTidurModel(
    title: '2. Membaca Ayat Kursi',
    arabic: 'اللَّهُ لَا إِلَٰهَ إِلَّا هُوَ الْحَيُّ الْقَيُّومُ...',
    latin: 'Allahu laa ilaaha illa huwal hayyul qayyuum...',
    translation: '"Allah, tidak ada tuhan selain Dia. Yang Maha Hidup, yang terus-menerus mengurus (makhluk-Nya)..."',
    source: 'HR. Bukhari no. 2311 (Fadhilah: Dijaga malaikat & tidak didekati setan sampai pagi)',
  ),
  DoaTidurModel(
    title: '3. Membaca 2 Ayat Terakhir Al-Baqarah',
    arabic: 'آمَنَ الرَّسُولُ بِمَا أُنْزِلَ إِلَيْهِ مِنْ رَبِّهِ... لَا يُكَلِّفُ اللَّهُ نَفْسًا إِلَّا وُسْعَهَا...',
    latin: 'Aamanar-rasoolu bimaa unzila ilaihi mir-rabbihi... Laa yukallifullahu nafsan illa wus\'ahaa...',
    translation: '"Rasul telah beriman kepada apa yang diturunkan kepadanya... Allah tidak membebani seseorang melainkan sesuai dengan kesanggupannya..."',
    source: 'HR. Bukhari no. 5009 & Muslim no. 808 (Fadhilah: Akan dicukupkan baginya dari segala keburukan)',
  ),
  DoaTidurModel(
    title: '4. Membaca Tasbih Fatimah',
    arabic: 'سُبْحَانَ اللَّهِ (٣٣x) ، الْحَمْدُ لِلَّهِ (٣٣x) ، اللَّهُ أَكْبَرُ (٣٤x)',
    latin: 'Subhanallah (33x), Alhamdulillah (33x), Allahu Akbar (34x).',
    translation: '"Maha Suci Allah, Segala puji bagi Allah, Allah Maha Besar."',
    source: 'HR. Bukhari no. 3113 & Muslim no. 2727',
  ),
];

// 3. DATA DOA GELISAH & MIMPI BURUK
final List<DoaTidurModel> dataDoaGelisah = [
  DoaTidurModel(
    title: 'Doa Saat Gelisah di Malam Hari',
    arabic: 'لَا إِلَهَ إِلَّا اللَّهُ الْوَاحِدُ الْقَهَّارُ، رَبُّ السَّمَاوَاتِ وَالْأَرْضِ وَمَا بَيْنَهُمَا الْعَزِيزُ الْغَفَّارُ',
    latin: 'Laa ilaaha illallahul waahidul qohhaar, robbus samaawaati wal ardhi wa maa baynahumal \'aziizul ghoffaar.',
    translation: '"Tidak ada sesembahan yang berhak disembah selain Allah, Yang Maha Esa lagi Maha Menundukkan. Tuhan langit dan bumi dan apa yang ada di antara keduanya, Yang Maha Perkasa lagi Maha Pengampun."',
    source: 'HR. An-Nasa\'i dalam Al-Kubra, Al-Hakim (Shahih menurut Adz-Dzahabi)',
  ),
  DoaTidurModel(
    title: 'Doa Terbangun Karena Kaget / Mimpi Buruk',
    arabic: 'أَعُوذُ بِكَلِمَاتِ اللَّهِ التَّامَّاتِ مِنْ غَضَبِهِ وَعِقَابِهِ وَشَرِّ عِبَادِهِ وَمِنْ هَمَزَاتِ الشَّيَاطِينِ وَأَنْ يَحْضُرُونِ',
    latin: 'A\'udzu bikalimaatillahit taammaati min ghodhobihi wa \'iqoobihi wa syarri \'ibaadihi wa min hamazaatisy syayaathiini wa an yahdhuruun.',
    translation: '"Aku berlindung dengan kalimat-kalimat Allah yang sempurna dari kemurkaan dan siksaan-Nya, dari kejahatan hamba-hamba-Nya, dari godaan setan, dan dari kedatangan mereka kepadaku."',
    source: 'HR. Abu Dawud no. 3893 & At-Tirmidzi no. 3528 (Hasan Lighairihi)',
  ),
];