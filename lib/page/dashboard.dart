import 'package:flutter/material.dart';

import '../pertemuan/pertemuan8.dart';
import '../pertemuan/pertemuan9.dart';
import '../pertemuan/pertemuan10.dart';
import '../pertemuan/pertemuan13.dart';
import '../pertemuan/pertemuan14.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  Future<void> _showContextMenu(
    BuildContext context,
    LongPressStartDetails details,
    String pertemuan,
  ) async {
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;

    final result = await showMenu<String>(
      context: context,
      position: RelativeRect.fromRect(
        Rect.fromPoints(
          details.globalPosition,
          details.globalPosition,
        ),
        Offset.zero & overlay.size,
      ),
      items: const [
        PopupMenuItem(
          value: 'Buka',
          child: Text('Buka'),
        ),
        PopupMenuItem(
          value: 'Detail',
          child: Text('Detail'),
        ),
        PopupMenuItem(
          value: 'Hapus',
          child: Text('Hapus'),
        ),
      ],
    );

    if (result != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '$result dipilih pada $pertemuan',
          ),
        ),
      );
    }
  }

  void _showOptionMenu(String value) {
    if (value == "Profil") {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Menu Profil Dipilih",
          ),
        ),
      );
    } else if (value == "Tentang") {
      showAboutDialog(
        context: context,
        applicationName: "Mobile Programming",
        applicationVersion: "1.0",
      );
    } else if (value == "Logout") {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Logout Berhasil",
          ),
        ),
      );
    }
  }

  Widget buildPertemuanCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Widget page,
  }) {
    return GestureDetector(
      onLongPressStart: (details) {
        _showContextMenu(
          context,
          details,
          title,
        );
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.all(15),
          leading: CircleAvatar(
            radius: 28,
            backgroundColor: Colors.deepPurple.shade100,
            child: Icon(
              icon,
              color: Colors.deepPurple,
              size: 30,
            ),
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              subtitle,
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
                builder: (_) => page,
              ),
            );
          },
        ),
      ),
    );
  }

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
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(
              Icons.more_vert,
            ),
            onSelected: _showOptionMenu,
            itemBuilder: (context) => const [
              PopupMenuItem(
                value: "Profil",
                child: Text(
                  "Profil",
                ),
              ),
              PopupMenuItem(
                value: "Tentang",
                child: Text(
                  "Tentang Aplikasi",
                ),
              ),
              PopupMenuItem(
                value: "Logout",
                child: Text(
                  "Logout",
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.deepPurple.shade200,
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: const Row(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.white,
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

              buildPertemuanCard(
                title: "Pertemuan 8",
                subtitle: "Autocomplete & Spinner",
                icon: Icons.auto_awesome,
                page: const Pertemuan8Page(),
              ),

              const SizedBox(height: 20),

              buildPertemuanCard(
                title: "Pertemuan 9",
                subtitle: "Date & Time Picker",
                icon: Icons.calendar_month,
                page: const Pertemuan9Page(),
              ),

              const SizedBox(height: 20),

              buildPertemuanCard(
                title: "Pertemuan 10",
                subtitle: "Firebase Authentication",
                icon: Icons.lock,
                page: const Pertemuan10Page(),
              ),

              const SizedBox(height: 20),

              buildPertemuanCard(
                title: "Pertemuan 13",
                subtitle: "Audio Video & CRUD Produk",
                icon: Icons.video_library,
                page: const Pertemuan13Page(),
              ),

              const SizedBox(height: 20),

              buildPertemuanCard(
                title: "Pertemuan 14",
                subtitle: "Google Maps & OpenStreetMap",
                icon: Icons.map,
                page: const Pertemuan14Page(),
              ),

              const SizedBox(height: 40),

              Center(
                child: Column(
                  children: [
                    Icon(
                      Icons.flutter_dash,
                      size: 50,
                      color: Colors.deepPurple,
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