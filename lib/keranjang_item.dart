import 'package:flutter/material.dart';

class KeranjangItem extends StatefulWidget {
  final int stok;
  final int hargaAnggota;

  const KeranjangItem({
    super.key,
    required this.stok,
    required this.hargaAnggota,
  });

  @override
  State<KeranjangItem> createState() => _KeranjangItemState();
}

class _KeranjangItemState extends State<KeranjangItem> {
  int jumlah = 1;

  @override
  Widget build(BuildContext context) {
    int totalHarga = jumlah * widget.hargaAnggota;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: () {
            setState(() {
              if (jumlah > 0) {
                jumlah--;
              }
            });
          },
        ),

        Text(jumlah.toString()),

        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {            
            if (jumlah < widget.stok) {
              setState(() {
                jumlah++;
              });
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Jumlah sudah mencapai stok!'),
                ),
              );
            }
          },
        ),

        const SizedBox(width: 10),

        Text(
          'Total: Rp$totalHarga',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          )
        )
      ],
    );
  }
}