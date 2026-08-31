import 'package:flutter/material.dart';

import 'keranjang_item.dart';

class BarangCard extends StatelessWidget {
  final String nama;
  final int hargaAnggota;
  final int stok;
  final String kategori;
  final bool sorot;

  const BarangCard({
    super.key,
    required this.nama,
    required this.hargaAnggota,
    required this.stok,
    required this.kategori,
    this.sorot = true,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      color: sorot ? Colors.yellow[100] : null,
      child: ListTile(
        leading: const Icon(Icons.shopping_bag),
        title: Text(nama),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Anggota Rp' + hargaAnggota.toString()),
            Text(
              kategori,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
        trailing: KeranjangItem(
          stok: stok,
          hargaAnggota: hargaAnggota,
        ),
      ),
    );
  }
}