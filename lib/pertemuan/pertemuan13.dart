import 'package:flutter/material.dart';

import '../media/audio_video_page.dart';
import '../produk/product_page.dart';

class Pertemuan13Page extends StatelessWidget {
  const Pertemuan13Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pertemuan 13"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.music_note,
                  color: Colors.deepPurple,
                ),
                title: const Text("Audio & Video Player"),
                subtitle: const Text(
                  "Pemutaran Audio dan Video Flutter",
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const AudioVideoPage(),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.shopping_cart,
                  color: Colors.green,
                ),
                title: const Text("CRUD Produk"),
                subtitle: const Text(
                  "Tambah, Edit, Hapus Produk",
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProductPage(),
                    ),
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