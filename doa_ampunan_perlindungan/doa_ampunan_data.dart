class DoaAmpunanModel {
  final String title;
  final String arabic;
  final String latin;
  final String translation;
  final String reference;

  DoaAmpunanModel({
    required this.title,
    required this.arabic,
    required this.latin,
    required this.translation,
    required this.reference,
  });
}

final List<DoaAmpunanModel> kumpulanDoaAmpunan = [
  DoaAmpunanModel(
    title: 'Doa Abu Bakar (Mohon Ampunan Dalam Shalat)',
    arabic: 'اللَّهُمَّ إِنِّي ظَلَمْتُ نَفْسِي ظُلْمًا كَثِيرًا وَلَا يَغْفِرُ الذُّنُوبَ إِلَّا أَنْتَ فَاغْفِرْ لِي مَغْفِرَةً مِنْ عِنْدِكَ وَارْحَمْنِي إِنَّكَ أَنْتَ الْغَفُورُ الرَّحِيمُ',
    latin: 'Allahumma inni dholamtu nafsi dzulman katsiroo, wa laa yaghfirudz dzunuuba illa anta, faghfirlii maghfirotan min ‘indika warhamnii, innaka antal ghafuurur rahiim.',
    translation: '"Ya Allah, sesungguhnya aku telah menzalimi diriku sendiri dengan kezaliman yang banyak. Tiada yang dapat mengampuni dosa-dosa selain Engkau. Maka ampunilah aku dengan ampunan dari sisi-Mu, dan rahmatilah aku. Sesungguhnya Engkau Maha Pengampun lagi Maha Penyayang."',
    reference: 'HR. Bukhari no. 834 & Muslim no. 2705. Doa yang diajarkan Rasulullah SAW langsung kepada Abu Bakar untuk dibaca sebelum salam.',
  ),
  DoaAmpunanModel(
    title: 'Doa Perlindungan 4 Perkara (Tasyahud Akhir)',
    arabic: 'اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنْ عَذَابِ جَهَنَّمَ ، وَمِنْ عَذَابِ الْقَبْرِ ، وَمِنْ فِتْنَةِ الْمَحْيَا وَالْمَمَاتِ ، وَمِنْ شَرِّ فِتْنَةِ الْمَسِيحِ الدَّجَّالِ',
    latin: 'Allahumma inni a\'udzu bika min \'adzabi jahannam, wa min \'adzabil qobri, wa min fitnatil mahya wal mamati, wa min syarri fitnatil masiihid dajjaal.',
    translation: '"Ya Allah, sesungguhnya aku berlindung kepada-Mu dari azab neraka Jahannam, dari azab kubur, dari fitnah kehidupan dan kematian, dan dari keburukan fitnah Al-Masih Ad-Dajjal."',
    reference: 'HR. Muslim no. 588. Dibaca di akhir tasyahud sebelum salam.',
  ),
  DoaAmpunanModel(
    title: 'Doa Istighfar Nabi Yunus (Keluar dari Kesulitan)',
    arabic: 'لَا إِلَٰهَ إِلَّا أَنْتَ سُبْحَانَكَ إِنِّي كُنْتُ مِنَ الظَّالِمِينَ',
    latin: 'Laa ilaha illa anta subhanaka inni kuntu minadh dholimiin.',
    translation: '"Tidak ada sesembahan yang berhak disembah selain Engkau, Maha Suci Engkau, sesungguhnya aku termasuk orang-orang yang zalim."',
    reference: 'QS. Al-Anbiya: 87 & HR. Tirmidzi no. 3505. Rasulullah bersabda: Tidaklah seorang muslim berdoa dengannya kecuali Allah kabulkan.',
  ),
  DoaAmpunanModel(
    title: 'Doa Taubat Nabi Adam',
    arabic: 'رَبَّنَا ظَلَمْنَا أَنْفُسَنَا وَإِنْ لَمْ تَغْفِرْ لَنَا وَتَرْحَمْنَا لَنَكُونَنَّ مِنَ الْخَاسِرِينَ',
    latin: 'Robbana dholamnaa anfusanaa wa illam taghfir lanaa wa tarhamnaa lanakuunanna minal khaasiriin.',
    translation: '"Wahai Tuhan kami, kami telah menganiaya diri kami sendiri, dan jika Engkau tidak mengampuni kami dan memberi rahmat kepada kami, niscaya pastilah kami termasuk orang-orang yang merugi."',
    reference: 'QS. Al-A\'raf: 23. Doa taubat pertama manusia di bumi.',
  ),
  DoaAmpunanModel(
    title: 'Doa Sapu Jagad (Ampunan & Perlindungan Api Neraka)',
    arabic: 'رَبَّنَا آتِنَا فِي الدُّنْيَا حَسَنَةً وَفِي الْآخِرَةِ حَسَنَةً وَقِنَا عَذَابَ النَّارِ',
    latin: 'Robbana aatina fid dunyaa hasanah, wa fil aakhiroti hasanah, wa qinaa \'adzaban naar.',
    translation: '"Wahai Tuhan kami, berilah kami kebaikan di dunia dan kebaikan di akhirat, dan lindungilah kami dari azab neraka."',
    reference: 'QS. Al-Baqarah: 201 & HR. Bukhari no. 4522. Doa yang paling sering dibaca oleh Rasulullah SAW.',
  ),
  DoaAmpunanModel(
    title: 'Doa Ampunan Dosa Masa Lalu dan Masa Depan',
    arabic: 'اللَّهُمَّ اغْفِرْ لِي مَا قَدَّمْتُ وَمَا أَخَّرْتُ وَمَا أَسْرَرْتُ وَمَا أَعْلَنْتُ وَمَا أَسْرَفْتُ وَمَا أَنْتَ أَعْلَمُ بِهِ مِنِّي أَنْتَ الْمُقَدِّمُ وَأَنْتَ الْمُؤَخِّرُ لَا إِلَهَ إِلَّا أَنْتَ',
    latin: 'Allahummaghfir lii maa qoddamtu wa maa akh-khortu, wa maa asrortu wa maa a\'lantu, wa maa asroftu wa maa anta a\'lamu bihi minni. Antal muqoddimu wa antal mu-akh-khiru laa ilaha illa anta.',
    translation: '"Ya Allah, ampunilah dosa-dosaku yang telah lalu dan yang akan datang, yang aku lakukan secara sembunyi-sembunyi dan secara terang-terangan, yang aku lakukan secara berlebihan, dan dosa yang Engkau lebih mengetahuinya daripadaku. Engkau yang memajukan dan Engkau yang memundurkan, tidak ada ilah yang berhak disembah selain Engkau."',
    reference: 'HR. Muslim no. 771.',
  ),
];