import 'package:flutter/material.dart';
import 'barang_card.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static const List<Map<String, dynamic>> daftarBarang = [
    {'nama': 'Buku Tulis Bergaris 58 Lembar Sampul Tebal', 'anggota' : 3000, 'umum' : 3500, 'stok' : 40, 'kategori' : 'ATK'},
    {'nama': 'Pulpen', 'anggota' : 2500, 'umum' : 3000, 'stok' : 25, 'kategori' : 'ATK'},
    {'nama': 'Roti', 'anggota' : 5000, 'umum' : 5500, 'stok' : 15, 'kategori' : 'Makanan'},
    {'nama': 'Permen', 'anggota' : 2000, 'umum' : 3000, 'stok' : 40, 'kategori' : 'Makanan'},
    {'nama': 'Air Mineral', 'anggota' : 3500, 'umum' : 4000, 'stok' : 50, 'kategori' : 'Minuman'},

    //5 barang tambahan
    {'nama': 'Pensil', 'anggota' : 2000, 'umum' : 2500, 'stok' : 30, 'kategori' : 'ATK'},
    {'nama': 'Penghapus', 'anggota' : 1500, 'umum' : 2000, 'stok' : 50, 'kategori' : 'ATK'},
    {'nama': 'Keripik', 'anggota' : 200, 'umum' : 3000, 'stok' : 0, 'kategori' : 'Makanan'},
    {'nama': 'Susu', 'anggota' : 5000, 'umum' : 7000, 'stok' : 45, 'kategori' : 'Minuman'},
    {'nama': 'Penggaris', 'anggota' : 6000, 'umum' : 7000, 'stok' : 25, 'kategori' : 'ATK'},
  ];

 @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late TextEditingController _controller;
  String kataCari = '';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hasilCari = MyApp.daftarBarang
        .where((b) => b['nama'].toLowerCase().contains(kataCari))
        .toList();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Koperasi Sekolah'),
        ),
        body: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Cari barang...',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (nilai) {
                setState(() {
                  kataCari = nilai.toLowerCase();
                });
              },
            ),

            Text(
              'Lebar Layar: ' +
                MediaQuery.of(context).size.width.toStringAsFixed(0),
            ),
            // Menampilkan lebar layar

            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  int kolom;

                  if (constraints.maxWidth < 600) {
                    kolom = 1;
                  } else if (constraints.maxWidth < 900) {
                    kolom = 2;
                  } else {
                    kolom = 3;
                  }

                  return GridView.builder(
                    gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: kolom,
                      childAspectRatio: 3,
                    ),
                    itemCount: hasilCari.length,
                    itemBuilder: (context, index) {
                      final barang = hasilCari[index];

                      return BarangCard(
                        nama: barang['nama'],
                        hargaAnggota: barang['anggota'],
                        stok: barang['stok'],
                        kategori: barang['kategori'],
                        sorot: true,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}