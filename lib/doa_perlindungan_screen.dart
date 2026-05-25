import 'package:flutter/material.dart';
import '../kumpulan_doa_perlindungan/doa_perlindungan_data.dart';
import '../kumpulan_doa_perlindungan/doa_perlindungan_detail.dart';

class DoaPerlindunganScreen extends StatelessWidget {
  const DoaPerlindunganScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _header(),
              const SizedBox(height: 32),
              ...kumpulanDoaPerlindungan.map((doa) => _doaListItem(context, doa)),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header() => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              color: const Color(0xFFE4E3DE),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.black.withOpacity(0.08), width: 0.5),
            ),
            alignment: Alignment.center,
            child: const Text('</>', style: TextStyle(fontFamily: 'Courier', fontSize: 17, fontWeight: FontWeight.w700, color: Colors.black)),
          ),
          const SizedBox(width: 14),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('App-Doa', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black)),
                SizedBox(height: 2),
                Text('Kumpulan kategori dzikir & doa perlindungan', style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic, color: Colors.black87)),
              ],
            ),
          ),
        ],
      );

  Widget _doaListItem(BuildContext context, DoaPerlindunganModel doa) => GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DoaPerlindunganDetailScreen(doa: doa)),
          );
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.black.withOpacity(0.05)),
          ),
          child: Row(
            children: [
              const Icon(Icons.folder_open, size: 20, color: Colors.black54), // Diubah ikon folder biar estetik grup
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  doa.title,
                  style: const TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500),
                ),
              ),
              const Icon(Icons.chevron_right, size: 20, color: Colors.black26),
            ],
          ),
        ),
      );
}