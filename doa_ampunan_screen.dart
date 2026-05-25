import 'package:flutter/material.dart';
import '../kumpulandoaampunan/doa_ampunan_data.dart';
import '../kumpulandoaampunan/doa_ampunan_detail.dart';

class DoaAmpunanScreen extends StatelessWidget {
  const DoaAmpunanScreen({super.key});

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
              
              // Looping data otomatis dari database lokal
              ...dataDoaAmpunan.map((doa) => _doaListItem(context, doa)),
              
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
                Text('Kumpulan doa memohon ampunan kepada Allah', style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic, color: Colors.black87)),
              ],
            ),
          ),
        ],
      );

  Widget _doaListItem(BuildContext context, DoaAmpunanModel doa) => GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DoaAmpunanDetailScreen(doa: doa),
            ),
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
              const Icon(Icons.chevron_right, size: 20, color: Colors.black),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  doa.title, 
                  style: const TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      );
}