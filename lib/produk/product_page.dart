import 'package:flutter/material.dart';

import 'product_model.dart';
import 'add_product_page.dart';
import 'detail_product_page.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

  List<Product> products = [

    Product(
      nama: "Laptop ASUS",
      deskripsi: "Laptop Gaming Ryzen 7",
      gambar: "https://picsum.photos/300",
      harga: 12000000,
    ),

    Product(
      nama: "Mouse Logitech",
      deskripsi: "Mouse Wireless",
      gambar: "https://picsum.photos/301",
      harga: 250000,
    ),

    Product(
      nama: "Keyboard Mechanical",
      deskripsi: "RGB Mechanical Keyboard",
      gambar: "https://picsum.photos/302",
      harga: 650000,
    ),

    Product(
      nama: "Monitor LG",
      deskripsi: "24 Inch Full HD",
      gambar: "https://picsum.photos/303",
      harga: 2200000,
    ),

    Product(
      nama: "Printer Epson",
      deskripsi: "Printer Multifungsi",
      gambar: "https://picsum.photos/304",
      harga: 1800000,
    ),

    Product(
      nama: "Headset Gaming",
      deskripsi: "Surround Sound",
      gambar: "https://picsum.photos/305",
      harga: 550000,
    ),

    Product(
      nama: "Webcam HD",
      deskripsi: "1080P Camera",
      gambar: "https://picsum.photos/306",
      harga: 350000,
    ),

    Product(
      nama: "SSD Samsung",
      deskripsi: "SSD 1TB",
      gambar: "https://picsum.photos/307",
      harga: 1450000,
    ),

    Product(
      nama: "Flashdisk Sandisk",
      deskripsi: "64GB USB 3.0",
      gambar: "https://picsum.photos/308",
      harga: 95000,
    ),

    Product(
      nama: "Router TP-Link",
      deskripsi: "WiFi Dual Band",
      gambar: "https://picsum.photos/309",
      harga: 450000,
    ),

  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(

        title: const Text(
          "Katalog Produk",
        ),

        centerTitle: true,

        backgroundColor: Colors.deepPurple,

        foregroundColor: Colors.white,

      ),

      body: ListView.builder(

        padding: const EdgeInsets.all(12),

        itemCount: products.length,

        itemBuilder: (context, index) {

          Product product = products[index];

          return Card(

            elevation: 5,

            margin: const EdgeInsets.only(
              bottom: 15,
            ),

            shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(15),
            ),

            child: Padding(

              padding: const EdgeInsets.all(12),

              child: Row(

                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [

                  ClipRRect(

                    borderRadius:
                    BorderRadius.circular(12),

                    child: Image.network(

                      product.gambar,

                      width: 120,
                      height: 120,

                      fit: BoxFit.cover,

                    ),

                  ),

                  const SizedBox(width: 15),

                  Expanded(

                    child: Column(

                      crossAxisAlignment:
                      CrossAxisAlignment.start,

                      children: [

                        Text(

                          product.nama,

                          style: const TextStyle(

                            fontSize: 18,

                            fontWeight:
                            FontWeight.bold,

                          ),

                        ),

                        const SizedBox(height: 8),

                        Text(

                          product.deskripsi,

                          maxLines: 2,

                          overflow:
                          TextOverflow.ellipsis,

                          style: const TextStyle(
                            color: Colors.grey,
                          ),

                        ),

                        const SizedBox(height: 12),

                        Container(

                          padding:
                          const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),

                          decoration: BoxDecoration(

                            color: Colors.green,

                            borderRadius:
                            BorderRadius.circular(20),

                          ),

                          child: Text(

                            "Rp ${product.harga.toStringAsFixed(0)}",

                            style: const TextStyle(

                              color: Colors.white,

                              fontWeight:
                              FontWeight.bold,

                            ),

                          ),

                        ),

                        const SizedBox(height: 15),

                        Row(

                          children: [

                            Expanded(

                              child: ElevatedButton.icon(

                                icon: const Icon(
                                  Icons.visibility,
                                  size: 18,
                                ),

                                label: const Text(
                                  "Detail",
                                ),

                                onPressed: () {

                                  Navigator.push(

                                    context,

                                    MaterialPageRoute(

                                      builder: (_) =>
                                          DetailProductPage(
                                            product: product,
                                          ),

                                    ),

                                  );

                                },

                              ),

                            ),

                            const SizedBox(width: 5),

                            IconButton(

                              icon: const Icon(
                                Icons.edit,
                                color: Colors.blue,
                              ),

                              onPressed: () async {

                                final result =
                                await Navigator.push(

                                  context,

                                  MaterialPageRoute(

                                    builder: (_) =>
                                        AddProductPage(
                                          product: product,
                                        ),

                                  ),

                                );

                                if (result != null) {

                                  setState(() {

                                    products[index] =
                                    result;

                                  });

                                }

                              },

                            ),

                            IconButton(

                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),

                              onPressed: () {

                                showDialog(

                                  context: context,

                                  builder: (_) =>
                                      AlertDialog(

                                        title: const Text(
                                          "Hapus Produk",
                                        ),

                                        content: Text(
                                          "Yakin ingin menghapus ${product.nama} ?",
                                        ),

                                        actions: [

                                          TextButton(

                                            onPressed: () {

                                              Navigator.pop(
                                                context,
                                              );

                                            },

                                            child: const Text(
                                              "Batal",
                                            ),

                                          ),

                                          ElevatedButton(

                                            onPressed: () {

                                              setState(() {

                                                products.removeAt(
                                                  index,
                                                );

                                              });

                                              Navigator.pop(
                                                context,
                                              );

                                            },

                                            child: const Text(
                                              "Hapus",
                                            ),

                                          ),

                                        ],

                                      ),

                                );

                              },

                            ),

                          ],

                        ),

                      ],

                    ),

                  ),

                ],

              ),

            ),

          );

        },

      ),

      floatingActionButton:
      FloatingActionButton.extended(

        backgroundColor:
        Colors.deepPurple,

        icon: const Icon(
          Icons.add,
        ),

        label: const Text(
          "Tambah Produk",
        ),

        onPressed: () async {

          final result =
          await Navigator.push(

            context,

            MaterialPageRoute(

              builder: (_) =>
              const AddProductPage(),

            ),

          );

          if (result != null) {

            setState(() {

              products.add(result);

            });

          }

        },

      ),

    );

  }

}