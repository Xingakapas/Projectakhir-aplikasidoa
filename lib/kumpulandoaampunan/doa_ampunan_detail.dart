import 'package:flutter/material.dart';
import 'doa_ampunan_data.dart';

class DoaAmpunanDetailScreen extends StatelessWidget {
  final DoaAmpunanModel doa;

  const DoaAmpunanDetailScreen({super.key, required this.doa});

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
        title: const Text('Detail Doa Ampunan', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.black.withOpacity(0.05)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.02),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(doa.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.teal)),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  doa.arabic,
                  textAlign: TextAlign.right,
                  style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, height: 1.6, color: Colors.black87),
                ),
              ),
              const SizedBox(height: 24),
              const Divider(),
              const SizedBox(height: 16),
              const Text('Latin:', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.black54)),
              const SizedBox(height: 4),
              Text(doa.latin, style: const TextStyle(fontSize: 15, fontStyle: FontStyle.italic, color: Colors.black87)),
              const SizedBox(height: 16),
              const Text('Artinya:', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.black54)),
              const SizedBox(height: 4),
              Text(doa.translation, style: const TextStyle(fontSize: 15, color: Colors.black87, height: 1.4)),
              const SizedBox(height: 24),
              
              // KOTAK TEKS SUMBER HADITS
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.menu_book, size: 16, color: Colors.black54),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Sumber: ${doa.source}',
                        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black54, fontStyle: FontStyle.italic),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}