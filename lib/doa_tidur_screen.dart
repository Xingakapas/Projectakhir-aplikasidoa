import 'package:flutter/material.dart';
import '../kumpulan_doa_tidur/doa_tidur_data.dart';
import '../kumpulan_doa_tidur/doa_tidur_detail.dart';

class DoaTidurScreen extends StatelessWidget {
  const DoaTidurScreen({super.key});

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
              
              // Tombol 1: Doa Sebelum & Sesudah Tidur
              _doaListItem(
                context: context, 
                title: 'Doa Sebelum dan Sesudah Tidur', 
                targetPage: DoaTidurDetail(
                  pageTitle: 'Doa Sebelum & Sesudah Tidur',
                  dataList: dataDoaTidur,
                )
              ),
              
              // Tombol 2: Tutorial & Dzikir (Menampilkan Note Wudhu)
              _doaListItem(
                context: context, 
                title: 'Tutorial & Dzikir Sebelum Tidur', 
                targetPage: DoaTidurDetail(
                  pageTitle: 'Tutorial & Dzikir Tidur',
                  dataList: dataDzikirTidur,
                  showWudhuNote: true, // Note Wudhu ON
                )
              ),
            
              // Tombol 3: Gelisah & Mimpi Buruk (Menampilkan Note Mimpi)
              _doaListItem(
                context: context, 
                title: 'Doa Gelisah di Malam Hari', 
                targetPage: DoaTidurDetail(
                  pageTitle: 'Doa Gelisah & Mimpi Buruk',
                  dataList: dataDoaGelisah,
                  showMimpiNote: true, // Note Mimpi Buruk ON
                )
              ),
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
                Text('Kumpulan Doa ketika mau tidur', style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic, color: Colors.black87)),
              ],
            ),
          ),
        ],
      );

  Widget _doaListItem({required BuildContext context, required String title, required Widget targetPage}) => GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => targetPage),
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
              Expanded(child: Text(title, style: const TextStyle(fontSize: 16, color: Colors.black))),
            ],
          ),
        ),
      );
}