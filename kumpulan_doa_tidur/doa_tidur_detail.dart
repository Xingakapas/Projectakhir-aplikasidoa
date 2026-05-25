import 'package:flutter/material.dart';
import 'doa_tidur_data.dart'; 

class DoaTidurDetail extends StatelessWidget {
  final String pageTitle;
  final List<DoaTidurModel> dataList;
  final bool showWudhuNote;
  final bool showMimpiNote;

  const DoaTidurDetail({
    super.key,
    required this.pageTitle,
    required this.dataList,
    this.showWudhuNote = false,
    this.showMimpiNote = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          pageTitle, 
          style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600)
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // KOTAK NOTE WUDHU
            if (showWudhuNote)
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF9E6),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.amber.withOpacity(0.3)),
                ),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.info_outline, color: Colors.amber, size: 22),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        // Diperbaiki: Menggunakan \n untuk baris baru
                        '"Jika kamu mendatangi tempat tidurmu (hendak tidur), maka berwudhulah seperti wudhumu untuk shalat, kemudian berbaringlah di atas sisi tubuhmu yang kanan..."\n(HR. Bukhari no. 247 dan Muslim no. 2710).',
                        style: TextStyle(fontSize: 14, color: Colors.black87, height: 1.4),
                      ),
                    ),
                  ],
                ),
              ),

            // LOOPING LIST DOA
            ...dataList.map((doa) => Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.black.withOpacity(0.05)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(doa.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.teal)),
                      const SizedBox(height: 16),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(doa.arabic, textAlign: TextAlign.right, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, height: 1.6, color: Colors.black87)),
                      ),
                      const SizedBox(height: 20),
                      const Divider(),
                      const SizedBox(height: 12),
                      const Text('Latin / Instruksi:', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.black54)),
                      const SizedBox(height: 2),
                      Text(doa.latin, style: const TextStyle(fontSize: 15, fontStyle: FontStyle.italic, color: Colors.black87)),
                      const SizedBox(height: 16),
                      const Text('Artinya:', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.black54)),
                      const SizedBox(height: 2),
                      Text(doa.translation, style: const TextStyle(fontSize: 15, color: Colors.black87, height: 1.4)),
                      const SizedBox(height: 16),
                      
                      // KOTAK TEXT SUMBER HADITS
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          doa.source,
                          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black54, fontStyle: FontStyle.italic),
                        ),
                      ),
                    ],
                  ),
                )),

            // KOTAK NOTE MIMPI
            if (showMimpiNote)
              Container(
                margin: const EdgeInsets.only(top: 8),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF0F0F0),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.lightbulb_outline, color: Colors.black54, size: 20),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        // Diperbaiki: Menambahkan tanda kutip penutup dan \n untuk baris baru
                        '"Apabila salah seorang dari kalian melihat mimpi yang tidak disukainya (mimpi buruk), maka hendaklah ia meludah (meniup tanpa air liur) ke kirinya tiga kali, dan memohon perlindungan kepada Allah dari godaan syaitan tiga kali, dan hendaklah ia mengubah posisi tidurnya dari posisi semula."\n(HR. Muslim no. 2262)',
                        style: TextStyle(fontSize: 13, color: Colors.black87, height: 1.4),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}