class DoaSubItem {
  final String? subTitle; // Judul sub-bacaan (misal: Membaca Ayat Kursi)
  final String arabic;
  final String latin;
  final String translation;
  final String reference;

  DoaSubItem({
    this.subTitle,
    required this.arabic,
    required this.latin,
    required this.translation,
    required this.reference,
  });
}

class DoaPerlindunganModel {
  final String title;
  final String? note; // Untuk catatan sunnah seperti anjuran wudhu
  final List<DoaSubItem> items;

  DoaPerlindunganModel({
    required this.title,
    this.note,
    required this.items,
  });
}

final List<DoaPerlindunganModel> kumpulanDoaPerlindungan = [
  DoaPerlindunganModel(
    title: 'Doa Keluar Rumah',
    items: [
      DoaSubItem(
        arabic: 'بِسْمِ اللَّهِ تَوَكَّلْتُ عَلَى اللَّهِ، لاَ حَوْلَ وَلاَ قُوَّةَ إِلاَّ بِاللَّهِ',
        latin: 'Bismillahi tawakkaltu \'alallah, laa hawla wa laa quwwata illa billah.',
        translation: '"Dengan nama Allah, aku bertawakkal kepada Allah. Tidak ada daya dan kekuatan kecuali dengan (pertolongan) Allah."',
        reference: 'HR. Abu Dawud no. 5095, Tirmidzi no. 3426. Dihasankan oleh Syaikh Al-Albani.',
      ),
    ],
  ),
  DoaPerlindunganModel(
    title: 'Doa Berkendara & Perjalanan (Safar)',
    items: [
      DoaSubItem(
        subTitle: 'Doa Naik Kendaraan',
        arabic: 'سُبْحَانَ الَّذِى سَخَّرَ لَنَا هَذَا وَمَا كُنَّا لَهُ مُقْرِنِينَ وَإِنَّا إِلَى رَبِّنَا لَمُنْقَلِبُونَ',
        latin: 'Subhanalladzi sakh-khora lanaa hadza wa maa kunna lahu muqriniin. Wa innaa ilaa robbina lamun-qolibuun.',
        translation: '"Maha Suci Allah yang telah menundukkan semua ini bagi kami padahal kami sebelumnya tidak mampu menguasainya, dan sesungguhnya kami akan kembali kepada Tuhan kami."',
        reference: 'HR. Muslim no. 1342.',
      ),
      DoaSubItem(
        subTitle: 'Doa Safar (Perjalanan Jauh)',
        arabic: 'اللَّهُمَّ إِنَّا نَسْأَلُكَ فِى سَفَرِنَا هَذَا الْبِرَّ وَالتَّقْوَى وَمِنَ الْعَمَلِ مَا Tَرْضَى اللَّهُمَّ هَوِّن_ْ عَلَيْنَا سَفَرَنَا هَذَا وَاطْوِ عَنَّا بُعْدَهُ اللَّهُمَّ أَنْتَ الصَّاحِبُ فِى السَّفَرِ وَالْخَلِيفَةُ فِى الأَهْلِ',
        latin: 'Allahumma inna nas-aluka fii safarinaa hadzal birro wat taqwa wa minal \'amali maa tardho. Allahumma hawwin \'alayna safaronaa hadza, wathwi \'anna bu\'dahu. Allahumma antash shoohibu fis safar, wal kholiifatu fil ahli.',
        translation: '"Ya Allah, sesungguhnya kami memohon kebaikan dan takwa dalam bepergian ini... Engkaulah teman dalam bepergian dan yang mengurusi keluarga(ku)."',
        reference: 'HR. Muslim no. 1342.',
      ),
    ],
  ),
  DoaPerlindunganModel(
    title: 'Doa Berlindung dari Setan (Saat Singgah)',
    items: [
      DoaSubItem(
        arabic: 'أَعُوذُ بِكَلِمَاتِ اللَّهِ التَّامَّاتِ مِنْ شَرِّ مَا خَلَقَ',
        latin: 'A\'udzu bikalimaatillahit taammaati min syarri maa kholaq.',
        translation: '"Aku berlindung dengan kalimat-kalimat Allah yang sempurna dari kejahatan makhluk yang diciptakan-Nya."',
        reference: 'HR. Muslim no. 2708.',
      ),
    ],
  ),
  DoaPerlindunganModel(
    title: 'Dzikir Pagi (Lengkap berurutan)',
    items: [
      DoaSubItem(
        subTitle: '1. Membaca Ayat Kursi',
        arabic: 'اللَّهُ لَا إِلَٰهَ إِلَّا هُوَ الْحَيُّ الْقَيُّومُ ۚ لَا تَأْخُذُهُ سِنَةٌ وَلَا نَوْمٌ ۚ لَّهُ مَا فِي السَّمَاوَاتِ وَمَا فِي الْأَرْضِ ۗ مَن ذَا الَّذِي يَشْفَعُ عِندَهُ إِلَّا بِإِذْنِهِ ۚ يَعْلَمُ مَا بَيْنَ أَيْدِيهِمْ وَمَا خَلْفَهُمْ ۖ وَلَا يُحِيطُونَ بِشَيْءٍ mِّنْ عِلْمِهِ إِلَّا بِمَا شَاءَ ۚ وَسِعَ كُرْسِيُّهُ السَّمَاوَاتِ وَالْأَرْضَ ۖ وَلَا يَئُودُهُ حِفْظُهُمَا ۚ وَهُوَ الْعَلِيُّ الْعَظِيمُ',
        latin: 'Allahu laa ilaaha illa huwal hayyul qayyuum, laa ta\'khudzuhu sinatun walaa nawm...',
        translation: '"Allah, tidak ada tuhan selain Dia. Yang Maha Hidup, yang terus-menerus mengurus (makhluk-Nya)... Dan Dia Maha Tinggi, Maha Agung."',
        reference: 'HR. An-Nasa\'i, Al-Hakim. Dilindungi dari gangguan jin hingga petang.',
      ),
      DoaSubItem(
        subTitle: '2. Membaca Al-Ikhlas, Al-Falaq, An-Nas (3x)',
        arabic: 'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ (قُل *هُوَ اللَّهُ أَحَدٌ...) ، (قُلْ أَعُوذُ بِرَبِّ الْفَلَقِ...) ، (قُلْ أَعُوذُ بِرَبِّ النَّاسِ...)',
        latin: 'Membaca Surat Al-Ikhlas, Al-Falaq, dan An-Nas masing-masing sebanyak 3 kali.',
        translation: '"Membaca tiga surat perlindungan di waktu pagi dan petang."',
        reference: 'HR. Abu Dawud no. 5084, Tirmidzi no. 3575. Cukup melindungimu dari segala sesuatu.',
      ),
      DoaSubItem(
        subTitle: '3. Sayyidul Istighfar',
        arabic: 'اللَّهُمَّ أَنْتَ رَبِّي لاَ إِلَهَ إِلاَّ أَنْتَ ، خَلَقْتَنِي وَأَنَا عَبْدُكَ ، وَأَنَا عَلَى عَهْدِكَ وَوَعْدِكَ مَا اسْتَطَعْتُ ، أَعُوذُ بِكَ مِنْ شَرِّ مَا صَنَعْتُ ، أَبُوءُ لَكَ بِنِعْمَتِكَ عَلَيَّ ، وَأَبُوءُ بِذَنْبِي فَاغْفِرْ لِي ، فَإِنَّهُ لاَ يَغْفِرُ الذُّنُوبَ إِلاَّ أَنْتَ',
        latin: 'Allahumma anta robbii laa ilaha illa anta, kholaqtanii wa anaa ‘abduka...',
        translation: '"Ya Allah, Engkau adalah Tuhanku, tidak ada Tuhan yang berhak disembah selain Engkau..."',
        reference: 'HR. Bukhari no. 6306. Jika dibaca pagi hari dengan keyakinan lalu meninggal sebelum petang, termasuk ahli surga.',
      ),
      DoaSubItem(
        subTitle: '4. Doa Memasuki Waktu Pagi',
        arabic: 'اللَّهُمَّ بِكَ أَصْبَحْنَا، وَبِكَ أَمْسَيْنَا، وَبِكَ نَحْيَا، وَبِكَ نَمُوتُ، وَإِلَيْكَ النُّشُورُ',
        latin: 'Allahumma bika ash-bahnaa, wa bika amsaynaa, wa bika nahyaa, wa bika namuutu, wa ilaykan nusyuur.',
        translation: '"Ya Allah, dengan rahmat-Mu kami memasuki waktu pagi, dan dengan rahmat-Mu kami memasuki waktu petang..."',
        reference: 'HR. Tirmidzi no. 3391.',
      ),
    ],
  ),
  DoaPerlindunganModel(
    title: 'Dzikir Petang (Lengkap berurutan)',
    items: [
      DoaSubItem(
        subTitle: '1. Membaca Ayat Kursi',
        arabic: 'اللَّهُ لَا إِلَٰهَ إِلَّا هُوَ الْحَيُّ الْقَيُّومُ...',
        latin: 'Allahu laa ilaaha illa huwal hayyul qayyuum...',
        translation: '"Allah, tidak ada tuhan selain Dia. Yang Maha Hidup..."',
        reference: 'HR. An-Nasa\'i. Dilindungi dari gangguan jin hingga pagi hari.',
      ),
      DoaSubItem(
        subTitle: '2. Membaca Al-Ikhlas, Al-Falaq, An-Nas (3x)',
        arabic: 'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ (قُلْ هُوَ اللَّهُ أَحَدٌ...) إلخ',
        latin: 'Membaca Surat Al-Ikhlas, Al-Falaq, dan An-Nas masing-masing sebanyak 3 kali.',
        translation: '"Membaca tiga surat perlindungan di waktu petang."',
        reference: 'HR. Tirmidzi no. 3575.',
      ),
      DoaSubItem(
        subTitle: '3. Sayyidul Istighfar',
        arabic: 'اللَّهُمَّ أَنْتَ رَبِّي لاَ إِلَهَ إِلاَّ أَنْتَ...',
        latin: 'Allahumma anta robbii laa ilaha illa anta...',
        translation: '"Ya Allah, Engkau adalah Tuhanku..."',
        reference: 'HR. Bukhari no. 6306.',
      ),
      DoaSubItem(
        subTitle: '4. Doa Memasuki Waktu Petang',
        arabic: 'اللَّهُمَّ بِكَ أَمْسَيْنَا، وَبِكَ أَصْبَحْنَا، وَبِكَ نَحْيَا، وَبِكَ نَمُوتُ، وَإِلَيْكَ الْمَصِيرُ',
        latin: 'Allahumma bika amsaynaa, wa bika ash-bahnaa, wa bika nahyaa, wa bika namuutu, wa ilaykal mashiir.',
        translation: '"Ya Allah, dengan rahmat-Mu kami memasuki waktu petang, dan dengan rahmat-Mu kami memasuki waktu pagi..."',
        reference: 'HR. Tirmidzi no. 3391.',
      ),
    ],
  ),
  DoaPerlindunganModel(
    title: 'Dzikir Sebelum Tidur',
    note: 'Sunnah Sebelum Tidur:\nDianjurkan untuk berwudhu terlebih dahulu secara sempurna sebelum berbaring di tempat tidur.\n\nDalil: HR. Bukhari no. 247 & Muslim no. 2710. Rasulullah SAW bersabda: "Jika kamu mendatangi tempat tidurmu, maka berwudhulah seperti wudhumu untuk shalat..."',
    items: [
      DoaSubItem(
        subTitle: '1. Ritual Meniup Tangan & Membaca 3 Qul',
        arabic: 'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ (قُلْ هُوَ اللَّهُ أَحَدٌ...) وَالْفَلَقِ وَالنَّاسِ',
        latin: 'Membaca Al-Ikhlas, Al-Falaq, An-Nas, tiup ke telapak tangan, lalu usap ke seluruh tubuh (Ulangi 3x).',
        translation: '"Nabi SAW apabila hendak tidur, Beliau merapatkan kedua telapak tangannya, kemudian meniupnya dan membaca Al-Ikhlas, Al-Falaq, An-Nas, lalu mengusapkan ke tubuh..."',
        reference: 'HR. Bukhari no. 5017.',
      ),
      DoaSubItem(
        subTitle: '2. Membaca Ayat Kursi',
        arabic: 'اللَّهُ لَا إِلَٰهَ إِلَّا هُوَ الْحَيُّ الْقَيُّومُ...',
        latin: 'Allahu laa ilaaha illa huwal hayyul qayyuum...',
        translation: '"Allah, tidak ada tuhan selain Dia..."',
        reference: 'HR. Bukhari no. 2311. Allah akan mengutus malaikat menjagamu dan setan tidak akan mendekat hingga pagi.',
      ),
      DoaSubItem(
        subTitle: '3. Dua Ayat Terakhir Al-Baqarah (Ayat 285-286)',
        arabic: 'آمَنَ الرَّسُولُ بِمَا أُنْزِلَ إِلَيْهِ مِنْ رَبِّهِ وَالْمُؤْمِنُونَ... لَا يُكَلِّفُ اللَّهُ نَفْسًا إِلَّا وُسْعَهَا...',
        latin: 'Aamanar-rasoolu bimaa unzila ilaihi mir-rabbihi...',
        translation: '"Rasul telah beriman kepada apa yang diturunkan kepadanya... Allah tidak membebani seseorang melainkan sesuai dengan kesanggupannya..."',
        reference: 'HR. Bukhari no. 5009 & Muslim no. 808. Siapa yang membacanya pada malam hari, akan dicukupkan dan dilindungi dari segala keburukan.',
      ),
      DoaSubItem(
        subTitle: '4. Tasbih Fatimah',
        arabic: 'سُبْحَانَ اللَّهِ (٣٣إِكس) ، الْحَمْدُ لِلَّهِ (٣٣إِكس) ، اللَّهُ أَكْبَرُ (٣٤إِكس)',
        latin: 'Subhanallah (33x), Alhamdulillah (33x), Allahu Akbar (34x).',
        translation: '"Maha Suci Allah, Segala puji bagi Allah, Allah Maha Besar."',
        reference: 'HR. Bukhari no. 3705 & Muslim no. 2727. Menghilangkan lelah dan memberikan kekuatan fisik keesokan harinya.',
      ),
      DoaSubItem(
        subTitle: '5. Doa Sebelum Tidur Pendek',
        arabic: 'بِاسْمِكَ اللَّهُمَّ أَمُوتُ وَأَحْيَا',
        latin: 'Bismikallahumma amuutu wa ahyaa.',
        translation: '"Dengan menyebut nama-Mu, Ya Allah, aku mati dan aku hidup."',
        reference: 'HR. Bukhari no. 6324.',
      ),
    ],
  ),
];