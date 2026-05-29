import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  final String email;

  const HomePage({
    super.key,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xffF5F7FB),

      appBar: AppBar(

        elevation: 0,

        backgroundColor: const Color(0xff5B4BFF),

        title: const Text(
          "Home",
          style: TextStyle(
            color: Colors.white,
          ),
        ),

        leading: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),

        actions: [

          IconButton(

            onPressed: () {

              Navigator.pop(context);

            },

            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),

        ],
      ),

      body: Center(

        child: Container(

          margin: const EdgeInsets.all(25),

          padding: const EdgeInsets.all(30),

          decoration: BoxDecoration(

            gradient: const LinearGradient(

              colors: [
                Color(0xff6A5AE0),
                Color(0xff8E7CFF),
              ],

              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),

            borderRadius: BorderRadius.circular(35),

            boxShadow: [

              BoxShadow(
                color: Colors.deepPurple.withOpacity(0.3),
                blurRadius: 15,
                offset: const Offset(0, 8),
              ),

            ],
          ),

          child: Column(

            mainAxisSize: MainAxisSize.min,

            children: [

              // AVATAR

              Container(

                padding: const EdgeInsets.all(20),

                decoration: BoxDecoration(

                  color: Colors.white,

                  shape: BoxShape.circle,

                  boxShadow: [

                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                    ),

                  ],
                ),

                child: const Icon(
                  Icons.person,
                  size: 55,
                  color: Color(0xff6A5AE0),
                ),
              ),

              const SizedBox(height: 25),

              // TEXT WELCOME

              const Text(

                "Welcome, Admin",

                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              Text(

                email,

                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 35),

              // NOTIFIKASI

              Container(

                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 14,
                ),

                decoration: BoxDecoration(

                  color: const Color(0xffFF9F43),

                  borderRadius: BorderRadius.circular(25),

                  boxShadow: [

                    BoxShadow(
                      color: Colors.orange.withOpacity(0.3),
                      blurRadius: 10,
                    ),

                  ],
                ),

                child: const Row(

                  mainAxisSize: MainAxisSize.min,

                  children: [

                    Icon(
                      Icons.warning_amber_rounded,
                      color: Colors.white,
                    ),

                    SizedBox(width: 10),

                    Text(

                      "Email belum diverifikasi",

                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    SizedBox(width: 12),

                    Text(

                      "Verifikasi",

                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        decoration:
                        TextDecoration.underline,
                      ),
                    ),

                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}