import 'package:flutter/material.dart';

import 'register_page.dart';
import '../page/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isHidden = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(

        width: double.infinity,

        decoration: const BoxDecoration(

          gradient: LinearGradient(

            colors: [
              Color(0xff4facfe),
              Color(0xffb06ab3),
            ],

            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        child: Center(

          child: SingleChildScrollView(

            child: Padding(

              padding: const EdgeInsets.all(20),

              child: Column(

                children: [

                  Container(

                    width: 320,

                    padding: const EdgeInsets.all(25),

                    decoration: BoxDecoration(

                      color: Colors.white,

                      borderRadius: BorderRadius.circular(30),

                      boxShadow: [

                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        )

                      ],
                    ),

                    child: Column(

                      children: [

                        const SizedBox(height: 20),

                        const Icon(
                          Icons.lock_outline,
                          size: 70,
                          color: Colors.blue,
                        ),

                        const SizedBox(height: 25),

                        const Text(

                          "Welcome Back",

                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 35),

                        // EMAIL

                        TextField(

                          controller: emailController,

                          decoration: InputDecoration(

                            hintText: "Email",

                            prefixIcon: const Icon(Icons.email),

                            border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(10),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // PASSWORD

                        TextField(

                          controller: passwordController,

                          obscureText: isHidden,

                          decoration: InputDecoration(

                            hintText: "Password",

                            prefixIcon: const Icon(Icons.lock),

                            suffixIcon: IconButton(

                              onPressed: () {

                                setState(() {
                                  isHidden = !isHidden;
                                });

                              },

                              icon: Icon(

                                isHidden
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),

                            border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(10),
                            ),
                          ),
                        ),

                        const SizedBox(height: 30),

                        // BUTTON LOGIN

                        SizedBox(

                          width: double.infinity,

                          height: 50,

                          child: ElevatedButton(

                            style: ElevatedButton.styleFrom(

                              backgroundColor: Colors.blue,

                              shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(10),
                              ),
                            ),

                            onPressed: () {

                              Navigator.pushReplacement(

                                context,

                                MaterialPageRoute(

                                  builder: (context) =>
                                  HomePage(
                                    email:
                                    emailController.text,
                                  ),
                                ),
                              );

                            },

                            child: const Text(

                              "Login",

                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 30),

                      ],
                    ),
                  ),

                  const SizedBox(height: 15),

                  Row(

                    mainAxisAlignment:
                    MainAxisAlignment.center,

                    children: [

                      const Text(
                        "Don't have an account? ",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),

                      GestureDetector(

                        onTap: () {

                          Navigator.push(

                            context,

                            MaterialPageRoute(
                              builder: (context) =>
                              const RegisterPage(),
                            ),
                          );

                        },

                        child: const Text(

                          "Register",

                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                    ],
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}