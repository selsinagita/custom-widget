import 'package:flutter/material.dart';

class CardMahasiswa extends StatelessWidget {
  final String nama;
  final String nim;
  final String kelas;

  const CardMahasiswa({
    super.key,
    required this.nama,
    required this.nim,
    required this.kelas,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.purple[50],
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 20,
            backgroundColor: Colors.blue,
            child: Icon(Icons.person, color: Colors.white, size: 20),
          ),
          const SizedBox(height: 6),
          Text(
            'Nama: $nama',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12),
          ),
          Text(
            'NIM: $nim',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12),
          ),
          Text(
            'Kelas: $kelas',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
