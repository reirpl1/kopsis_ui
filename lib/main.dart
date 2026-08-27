import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int stok = 40;
  String kategori = 'ATK';

  IconData getIconKategori(String kategori) {
    switch (kategori) {
      case 'ATK':
        return Icons.edit;
      case 'Makanan':
        return Icons.fastfood;
      case 'Minuman':
        return Icons.local_drink;
      default: 
      return Icons.inventory_2;
    }
  }

  final List<Map<String, dynamic>> daftarBarang = [
    {'nama': 'Buku Tulis', 'anggota' : 3000, 'umum' : 3500, 'stok' : 40},
    {'nama': 'Pulpen', 'anggota' : 2500, 'umum' : 3000, 'stok' : 25},
    {'nama': 'Roti', 'anggota' : 5000, 'umum' : 5500, 'stok' : 15},
    {'nama': 'Permen', 'anggota' : 2000, 'umum' : 3000, 'stok' : 40},
    {'nama': 'Air Mineral', 'anggota' : 3500, 'umum' : 4000, 'stok' : 50},

    //5 barang tambahan
    {'nama': 'Pensil', 'anggota' : 2000, 'umum' : 2500, 'stok' : 30},
    {'nama': 'Penghapus', 'anggota' : 1500, 'umum' : 2000, 'stok' : 50},
    {'nama': 'Keripik', 'anggota' : 200, 'umum' : 3000, 'stok' : 15},
    {'nama': 'Susu', 'anggota' : 5000, 'umum' : 7000, 'stok' : 45},
    {'nama': 'Penggaris', 'anggota' : 6000, 'umum' : 7000, 'stok' : 25},
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Koperasi Sekolah'),
        ),
        body: ListView.builder(
          itemCount: daftarBarang.length,
          itemBuilder: (context, index) {
            final barang = daftarBarang[index];
            return Card(
              margin: const EdgeInsets.all(8),
              child: ListTile(
                leading: const Icon(Icons.inventory_2),
                title: Text(barang['nama']),
                subtitle: Text('Anggota Rp${barang['anggota']}'),
                trailing: Text('Stok ${barang['stok']}'),
              ),
            );
          },
        ),
      ),
    );
  }
}
