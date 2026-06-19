import 'package:flutter/material.dart';
import 'product_model.dart';

class AddProductPage extends StatefulWidget {

  final Product? product;

  const AddProductPage({
    super.key,
    this.product,
  });

  @override
  State<AddProductPage> createState() =>
      _AddProductPageState();
}

class _AddProductPageState
    extends State<AddProductPage> {

  final namaController =
      TextEditingController();

  final deskripsiController =
      TextEditingController();

  final gambarController =
      TextEditingController();

  final hargaController =
      TextEditingController();

  @override
  void initState() {

    super.initState();

    if (widget.product != null) {

      namaController.text =
          widget.product!.nama;

      deskripsiController.text =
          widget.product!.deskripsi;

      gambarController.text =
          widget.product!.gambar;

      hargaController.text =
          widget.product!.harga.toString();

    }

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text(
          widget.product == null
              ? "Tambah Produk"
              : "Edit Produk",
        ),
      ),

      body: Padding(

        padding: const EdgeInsets.all(16),

        child: Column(

          children: [

            TextField(
              controller: namaController,
              decoration:
                  const InputDecoration(
                labelText: "Nama Produk",
              ),
            ),

            TextField(
              controller:
                  deskripsiController,
              decoration:
                  const InputDecoration(
                labelText: "Deskripsi",
              ),
            ),

            TextField(
              controller: gambarController,
              decoration:
                  const InputDecoration(
                labelText: "URL Gambar",
              ),
            ),

            TextField(
              controller: hargaController,
              keyboardType:
                  TextInputType.number,
              decoration:
                  const InputDecoration(
                labelText: "Harga",
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(

              onPressed: () {

                Product product = Product(

                  nama:
                      namaController.text,

                  deskripsi:
                      deskripsiController
                          .text,

                  gambar:
                      gambarController.text,

                  harga: double.parse(
                    hargaController.text,
                  ),

                );

                Navigator.pop(
                  context,
                  product,
                );
              },

              child:
                  const Text("Simpan"),

            ),

          ],
        ),
      ),
    );
  }
}