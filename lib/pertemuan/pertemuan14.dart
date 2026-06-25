import 'package:flutter/material.dart';

import '../maps/google_maps_page.dart';
import '../maps/open_street_map_page.dart';

class Pertemuan14Page extends StatelessWidget {
  const Pertemuan14Page({super.key});

  Widget buildCard({
    required BuildContext context,
    required String title,
    required String subtitle,
    required IconData icon,
    required Widget page,
  }) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.deepPurple.shade100,
          child: Icon(
            icon,
            color: Colors.deepPurple,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(subtitle),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pertemuan 14"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            buildCard(
              context: context,
              title: "Google Maps",
              subtitle: "Maps menggunakan Google",
              icon: Icons.map,
              page: const GoogleMapsPage(),
            ),

            const SizedBox(height: 20),

            buildCard(
              context: context,
              title: "OpenStreetMap",
              subtitle: "Maps menggunakan OSM",
              icon: Icons.public,
              page: const OpenStreetMapPage(),
            ),
          ],
        ),
      ),
    );
  }
}