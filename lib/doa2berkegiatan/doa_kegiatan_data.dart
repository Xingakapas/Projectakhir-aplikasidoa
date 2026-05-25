class DoaKegiatanModel {
  final String title;
  final String arabic;
  final String latin;
  final String translation;
  final String reference; // Tambahan untuk sumber hadits

  DoaKegiatanModel({
    required this.title,
    required this.arabic,
    required this.latin,
    required this.translation,
    required this.reference,
  });
}

final List<DoaKegiatanModel> kumpulanDoaKegiatan = [
  DoaKegiatanModel(
    title: 'Doa Sebelum Makan',
    arabic: 'بِسْمِ اللَّهِ',
    latin: 'Bismillah.',
    translation: '"Dengan menyebut nama Allah." (Jika lupa di awal, ucapkan: Bismillahi fii awwalihi wa aakhirihi).',
    reference: 'HR. Bukhari no. 5376 & Muslim no. 2017. Jika lupa: HR. Abu Dawud no. 3767.',
  ),
  DoaKegiatanModel(
    title: 'Doa Sesudah Makan',
    arabic: 'الْحَمْدُ لِلَّهِ الَّذِى أَطْعَمَنِى هَذَا وَرَزَقَنِيهِ مِنْ غَيْرِ حَوْلٍ مِنِّى وَلاَ قُوَّةٍ',
    latin: 'Alhamdulillahilladzi ath\'amani hadza wa rozaqoniihi min ghoiri haulin minni wa laa quwwatin.',
    translation: '"Segala puji bagi Allah yang telah memberiku makanan ini dan merezekikannya kepadaku tanpa daya dan kekuatan dariku."',
    reference: 'HR. Abu Dawud no. 4023, Tirmidzi no. 3458, Ibnu Majah no. 3285. Dihasankan oleh Syaikh Al-Albani.',
  ),
  DoaKegiatanModel(
    title: 'Doa Ketika Mendengar Petir',
    arabic: 'سُبْحَانَ الَّذِي يُسَبِّحُ الرَّعْدُ بِحَمْدِهِ وَالْمَلَائِكَةُ مِنْ خِيفَتِهِ',
    latin: 'Subhanalladzi yusabbihur ra\'du bihamdihi wal malaa-ikatu min khiifatih.',
    translation: '"Maha Suci Allah yang petir bertasbih dengan memuji-Nya, begitu juga para malaikat karena takut kepada-Nya."',
    reference: 'Muwaththo’ Malik no. 3641, Al-Adabul Mufrad no. 723. Sanadnya shahih.',
  ),
  DoaKegiatanModel(
    title: 'Doa Ketika Turun Hujan',
    arabic: 'اللَّهُمَّ صَيِّباً نَافِعاً',
    latin: 'Allahumma shoyyiban naafi\'an.',
    translation: '"Ya Allah, turunkanlah pada kami hujan yang bermanfaat."',
    reference: 'HR. Bukhari no. 1032.',
  ),
  DoaKegiatanModel(
    title: 'Doa Setelah Hujan Berhenti',
    arabic: 'مُطِرْنَا بِفَضْلِ اللَّهِ وَرَحْمَتِهِ',
    latin: 'Muthirna bi fadhlillahi wa rahmatih.',
    translation: '"Kita diberi hujan karena karunia dan rahmat Allah."',
    reference: 'HR. Bukhari no. 1038 dan Muslim no. 71.',
  ),
  DoaKegiatanModel(
    title: 'Doa Ketika Sedih, Galau & Gelisah',
    arabic: 'اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنَ الْهَمِّ وَالْحَزَنِ، وَالْعَجْزِ وَالْكَسَلِ، وَالْبُخْلِ وَالْجُبْنِ، وَضَلَعِ الدَّيْنِ وَغَلَبَةِ الرِّجَالِ',
    latin: 'Allahumma inni a\'udzu bika minal hammi wal hazan, wal \'ajzi wal kasal, wal bukhli wal jubn, wa dholoa\'id daini wa gholabatir rijaal.',
    translation: '"Ya Allah, aku berlindung kepada-Mu dari rasa sedih dan gelisah, lemah dan malas, pelit dan penakut, serta dari lilitan hutang dan penindasan orang."',
    reference: 'HR. Bukhari no. 2893.',
  ),
  DoaKegiatanModel(
    title: 'Doa Ketika Mengalami Kesusahan Berat',
    arabic: 'لاَ إِلَهَ إِلاَّ اللَّهُ الْعَظِيمُ الْحَلِيمُ، لاَ إِلَهَ إِلاَّ اللَّهُ رَبُّ الْعَرْشِ الْعَظِيمِ، لاَ إِلَهَ إِلاَّ اللَّهُ رَبُّ السَّمَوَاتِ وَرَبُّ الأَرْضِ، وَرَبُّ الْعَرْشِ الْكَرِيمِ',
    latin: 'Laa ilaha illallahul \'azhiimul haliim, laa ilaha illallahu rabbul \'arsyil \'azhiim, laa ilaha illallahu rabbus samawaati wa rabbul ardhi, wa rabbul \'arsyil kariim.',
    translation: '"Tiada sesembahan yang berhak disembah selain Allah Yang Maha Agung lagi Maha Penyantun. Tiada sesembahan yang berhak disembah selain Allah, Rabb yang menguasai arsy yang agung. Tiada sesembahan yang berhak disembah selain Allah, Rabb langit dan bumi, dan Rabb arsy yang mulia."',
    reference: 'HR. Bukhari no. 6345 dan Muslim no. 2730.',
  ),
  DoaKegiatanModel(
    title: 'Doa Keluar Rumah',
    arabic: 'بِسْمِ اللَّهِ تَوَكَّلْتُ عَلَى اللَّهِ، لاَ حَوْلَ وَلاَ قُوَّةَ إِلاَّ بِاللَّهِ',
    latin: 'Bismillahi tawakkaltu \'alallah, laa hawla wa laa quwwata illa billah.',
    translation: '"Dengan nama Allah, aku bertawakkal kepada Allah. Tidak ada daya dan kekuatan kecuali dengan (pertolongan) Allah."',
    reference: 'HR. Abu Dawud no. 5095, Tirmidzi no. 3426. Dihasankan oleh Syaikh Al-Albani.',
  ),
  DoaKegiatanModel(
    title: 'Doa Bangun Tidur',
    arabic: 'الْحَمْدُ لِلَّهِ الَّذِى أَحْيَانَا بَعْدَ مَا أَمَاتَنَا وَإِلَيْهِ النُّشُورُ',
    latin: 'Alhamdulillahilladzi ahyana ba\'da ma amatana wa ilaihin nusyur.',
    translation: '"Segala puji bagi Allah, yang telah membangunkan kami setelah menidurkan kami, dan kepada-Nya lah kami dibangkitkan."',
    reference: 'HR. Bukhari no. 6312 dan Muslim no. 2711.',
  ),
  DoaKegiatanModel(
    title: 'Doa Sebelum Tidur',
    arabic: 'بِاسْمِكَ اللَّهُمَّ أَمُوتُ وَأَحْيَا',
    latin: 'Bismikallahumma amuutu wa ahyaa.',
    translation: '"Dengan menyebut nama-Mu, Ya Allah, aku mati dan aku hidup."',
    reference: 'HR. Bukhari no. 6324.',
  ),
];