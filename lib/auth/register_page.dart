import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

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

                        const SizedBox(height: 10),

                        const Icon(
                          Icons.person_add_alt_1,
                          size: 70,
                          color: Colors.blue,
                        ),

                        const SizedBox(height: 20),

                        const Text(

                          "Create Account",

                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 30),

                        // NAME

                        TextField(

                          controller: nameController,

                          decoration: InputDecoration(

                            hintText: "Full Name",

                            prefixIcon:
                            const Icon(Icons.person),

                            border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(10),
                            ),
                          ),
                        ),

                        const SizedBox(height: 15),

                        // EMAIL

                        TextField(

                          controller: emailController,

                          decoration: InputDecoration(

                            hintText: "Email",

                            prefixIcon:
                            const Icon(Icons.email),

                            border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(10),
                            ),
                          ),
                        ),

                        const SizedBox(height: 15),

                        // PASSWORD

                        TextField(

                          controller: passwordController,

                          obscureText: isHidden,

                          decoration: InputDecoration(

                            hintText: "Password",

                            prefixIcon:
                            const Icon(Icons.lock),

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

                        const SizedBox(height: 15),

                        // CONFIRM PASSWORD

                        TextField(

                          controller: confirmController,

                          obscureText: isHidden,

                          decoration: InputDecoration(

                            hintText: "Confirm Password",

                            prefixIcon:
                            const Icon(Icons.lock),

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

                        const SizedBox(height: 25),

                        // BUTTON REGISTER

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

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(

                                const SnackBar(
                                  content: Text(
                                    "Register Berhasil",
                                  ),
                                ),
                              );

                              Navigator.pop(context);

                            },

                            child: const Text(

                              "Register",

                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),

                  const SizedBox(height: 15),

                  Row(

                    mainAxisAlignment:
                    MainAxisAlignment.center,

                    children: [

                      const Text(
                        "Already have an account? ",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),

                      GestureDetector(

                        onTap: () {

                          Navigator.pop(context);

                        },

                        child: const Text(

                          "Login",

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