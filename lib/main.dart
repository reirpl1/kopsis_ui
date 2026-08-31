import 'package:flutter/material.dart';
import 'barang_card.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const List<Map<String, dynamic>> daftarBarang = [
    {'nama': 'Buku Tulis', 'anggota' : 3000, 'umum' : 3500, 'stok' : 40, 'kategori' : 'ATK'},
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
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Koperasi Sekolah'),
        ),
        body: ListView.builder(
          itemCount: daftarBarang.where((barang) => barang['stok'] > 0).length,
          itemBuilder: (context, index) {
            final barang =
                daftarBarang.where((barang) => barang['stok'] > 0).toList()[index];
            return BarangCard(
              nama: barang['nama'],
              hargaAnggota: barang['anggota'],
              stok: barang['stok'],
              kategori: barang['kategori'],
              sorot: true,
            );
          },
        ),
      ),
    );
  }
}
