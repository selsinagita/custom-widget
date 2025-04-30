import 'dart:math';
import 'package:costum_widget/componen/card_mahasiswa.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';
import 'package:costum_widget/componen/card_mahasiswa.dart';

class ProfileScreen extends StatefulWidget {
  final String nama;
  final String email;

  const ProfileScreen({super.key, required this.nama, required this.email});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Color warnaLatar = Colors.white;

  List<Map<String, String>> mahasiswaList = [
    {'nama': 'Selsi Nagita', 'nim': '230101121', 'kelas': 'SI23A2'},
    {'nama': 'Rama Sanjaya', 'nim': '230101122', 'kelas': 'SI23A1'},
    {'nama': 'Daniel ismail', 'nim': '230101123', 'kelas': 'SI23B1'},
    {'nama': 'Ermareta Hanasya', 'nim': '230101232', 'kelas': 'SI23A2'},
  ];

  void gantiWarna() {
    setState(() {
      List<Color> daftarWarna = [
        Colors.white,
        const Color.fromARGB(255, 203, 156, 226),
        Colors.blue,
        Colors.green,
        Colors.red,
        Colors.yellow,
        Colors.orange,
        Colors.purple,
        Colors.pink,
      ];
      Random random = Random();
      warnaLatar = daftarWarna[random.nextInt(daftarWarna.length)];
    });
  }

  void kembaliKeLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: warnaLatar,
      appBar: AppBar(
        title: const Text('Profil Saya'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: kembaliKeLogin,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: mahasiswaList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) {
                var m = mahasiswaList[index];
                return CardMahasiswa(
                  nama: m['nama'] ?? '',
                  nim: m['nim'] ?? '',
                  kelas: m['kelas'] ?? '',
                );
              },
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: gantiWarna,
                  child: const Text('Ganti Warna Background'),
                ),
                const SizedBox(height: 10),
                Text(widget.nama),
                Text(widget.email),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
