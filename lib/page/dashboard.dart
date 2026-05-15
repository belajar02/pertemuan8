import 'package:flutter/material.dart';
import '../pertemuan/pertemuan8.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Dashboard"),
        backgroundColor: Colors.deepPurple,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(20),
              ),

              child: const Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [

                  Text(
                    "Mobile Programming",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 5),

                  Text(
                    "Daftar Pertemuan",
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),

                ],
              ),
            ),

            const SizedBox(height: 30),

            Card(
              elevation: 5,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),

              child: ListTile(

                leading: CircleAvatar(
                  backgroundColor:
                  Colors.deepPurple.shade100,

                  child: const Icon(
                    Icons.book,
                    color: Colors.deepPurple,
                  ),
                ),

                title: const Text(
                  "Pertemuan 8",
                ),

                subtitle: const Text(
                  "Autocomplete & Spinner",
                ),

                trailing:
                const Icon(Icons.arrow_forward_ios),

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

          ],
        ),
      ),
    );
  }
}