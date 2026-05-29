import 'package:flutter/material.dart';

import '../auth/auth_page.dart';

class Pertemuan10Page extends StatelessWidget {
  const Pertemuan10Page({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Pertemuan 10"),
        backgroundColor: Colors.deepPurple,
      ),

      body: Center(

        child: ElevatedButton(

          onPressed: () {

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AuthPage(),
              ),
            );

          },

          child: const Text("Masuk ke Firebase Auth"),
        ),
      ),
    );
  }
}