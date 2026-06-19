import 'package:flutter/material.dart';
import 'product_model.dart';

class DetailProductPage
    extends StatelessWidget {

  final Product product;

  const DetailProductPage({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title:
            const Text("Detail Produk"),
      ),

      body: SingleChildScrollView(

        child: Column(

          children: [

            Image.network(
              product.gambar,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            Padding(

              padding:
                  const EdgeInsets.all(16),

              child: Column(

                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  Text(

                    product.nama,

                    style:
                        const TextStyle(
                      fontSize: 24,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  Text(
                    product.deskripsi,
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  Text(

                    "Rp ${product.harga}",

                    style:
                        const TextStyle(
                      color: Colors.green,
                      fontSize: 22,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}