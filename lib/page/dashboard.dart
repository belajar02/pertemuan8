import 'package:flutter/material.dart';

import '../pertemuan/pertemuan8.dart';
import '../pertemuan/pertemuan9.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(

        title: const Text(
          "Dashboard",
        ),

        centerTitle: true,

        backgroundColor: Colors.deepPurple,
      ),

      body: SingleChildScrollView(

        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(

            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [

              // HEADER DASHBOARD

              Container(

                width: double.infinity,

                padding: const EdgeInsets.all(25),

                decoration: BoxDecoration(

                  gradient: const LinearGradient(

                    colors: [
                      Colors.deepPurple,
                      Colors.purple,
                    ],

                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),

                  borderRadius:
                  BorderRadius.circular(25),

                  boxShadow: [

                    BoxShadow(
                      color: Colors.deepPurple.shade200,
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),

                  ],
                ),

                child: const Column(

                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [

                    Row(

                      children: [

                        CircleAvatar(

                          radius: 28,

                          backgroundColor:
                          Colors.white,

                          child: Icon(
                            Icons.mobile_friendly,
                            size: 30,
                            color: Colors.deepPurple,
                          ),
                        ),

                        SizedBox(width: 15),

                        Expanded(

                          child: Column(

                            crossAxisAlignment:
                            CrossAxisAlignment.start,

                            children: [

                              Text(
                                "Mobile Programming",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight:
                                  FontWeight.bold,
                                ),
                              ),

                              SizedBox(height: 5),

                              Text(
                                "Dashboard Pertemuan",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 15,
                                ),
                              ),

                            ],
                          ),
                        ),

                      ],
                    ),

                  ],
                ),
              ),

              const SizedBox(height: 35),

              const Text(
                "Daftar Pertemuan",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),

              const SizedBox(height: 20),

              // PERTEMUAN 8

              Card(

                elevation: 5,

                shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(18),
                ),

                child: ListTile(

                  contentPadding:
                  const EdgeInsets.all(15),

                  leading: CircleAvatar(

                    radius: 28,

                    backgroundColor:
                    Colors.deepPurple.shade100,

                    child: const Icon(
                      Icons.auto_awesome,
                      color: Colors.deepPurple,
                      size: 30,
                    ),
                  ),

                  title: const Text(
                    "Pertemuan 8",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),

                  subtitle: const Padding(
                    padding: EdgeInsets.only(top: 5),

                    child: Text(
                      "Autocomplete & Spinner",
                    ),
                  ),

                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.deepPurple,
                  ),

                  onTap: () {

                    Navigator.push(

                      context,

                      MaterialPageRoute(

                        builder: (context) =>
                        const Pertemuan8Page(),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),

              // PERTEMUAN 9

              Card(

                elevation: 5,

                shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(18),
                ),

                child: ListTile(

                  contentPadding:
                  const EdgeInsets.all(15),

                  leading: CircleAvatar(

                    radius: 28,

                    backgroundColor:
                    Colors.deepPurple.shade100,

                    child: const Icon(
                      Icons.calendar_month,
                      color: Colors.deepPurple,
                      size: 30,
                    ),
                  ),

                  title: const Text(
                    "Pertemuan 9",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),

                  subtitle: const Padding(
                    padding: EdgeInsets.only(top: 5),

                    child: Text(
                      "Date & Time Picker",
                    ),
                  ),

                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.deepPurple,
                  ),

                  onTap: () {

                    Navigator.push(

                      context,

                      MaterialPageRoute(

                        builder: (context) =>
                        const Pertemuan9Page(),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 40),

              // FOOTER

              Center(

                child: Column(

                  children: [

                    Icon(
                      Icons.flutter_dash,
                      size: 50,
                      color: Colors.deepPurple.shade300,
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      "Flutter Mobile Programming",
                      style: TextStyle(
                        color: Colors.grey,
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