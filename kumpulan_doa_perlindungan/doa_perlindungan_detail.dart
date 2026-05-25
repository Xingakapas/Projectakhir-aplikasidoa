import 'package:flutter/material.dart';
import 'doa_perlindungan_data.dart';

class DoaPerlindunganDetailScreen extends StatelessWidget {
  final DoaPerlindunganModel doa;

  const DoaPerlindunganDetailScreen({super.key, required this.doa});

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
          doa.title,
          style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Jika ada Catatan Sunnah (seperti anjuran Berwudhu sebelum tidur)
            if (doa.note != null) ...[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF9E6), // Kuning soft tanda info/sunnah
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.amber.withOpacity(0.3)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.info_outline, color: Colors.amber, size: 22),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        doa.note!,
                        style: const TextStyle(fontSize: 14, color: Colors.black87, height: 1.4),
                      ),
                    ),
                  ],
                ),
              ),
            ],

            // Looping List Bacaan di dalam kelompok/grup
            ...doa.items.map((item) {
              return Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.black.withOpacity(0.05)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (item.subTitle != null) ...[
                      Text(
                        item.subTitle!,
                        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.teal),
                      ),
                      const SizedBox(height: 14),
                    ],
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        item.arabic,
                        textAlign: TextAlign.right,
                        style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, height: 1.6, color: Colors.black87),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Divider(),
                    const SizedBox(height: 12),
                    const Text('Latin:', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.black54)),
                    const SizedBox(height: 2),
                    Text(item.latin, style: const TextStyle(fontSize: 15, fontStyle: FontStyle.italic, color: Colors.black87)),
                    const SizedBox(height: 16),
                    const Text('Artinya:', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.black54)),
                    const SizedBox(height: 2),
                    Text(item.translation, style: const TextStyle(fontSize: 15, color: Colors.black87, height: 1.4)),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(color: const Color(0xFFF5F5F5), borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.menu_book, size: 15, color: Colors.black45),
                          const SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              'Sumber: ${item.reference}',
                              style: const TextStyle(fontSize: 12, color: Colors.black54, fontStyle: FontStyle.italic),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}