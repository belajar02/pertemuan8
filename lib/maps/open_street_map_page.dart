import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

class OpenStreetMapPage extends StatefulWidget {
  const OpenStreetMapPage({super.key});

  @override
  State<OpenStreetMapPage> createState() =>
      _OpenStreetMapPageState();
}

class _OpenStreetMapPageState
    extends State<OpenStreetMapPage> {

  final MapController mapController =
      MapController();

  LatLng kampus =
      LatLng(-6.200000, 106.816666);

  LatLng? lokasiSaya;

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  Future<void> getCurrentLocation() async {

    LocationPermission permission =
        await Geolocator.checkPermission();

    if (permission ==
        LocationPermission.denied) {

      await Geolocator.requestPermission();

    }

    Position position =
        await Geolocator.getCurrentPosition();

    setState(() {

      lokasiSaya = LatLng(
        position.latitude,
        position.longitude,
      );

    });
  }

  void moveToMyLocation() {

    if (lokasiSaya != null) {

      mapController.move(
        lokasiSaya!,
        16,
      );

    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title:
            const Text("OpenStreetMap"),
        backgroundColor:
            Colors.deepPurple,
      ),

      body: FlutterMap(

        mapController: mapController,

        options: MapOptions(
          initialCenter: kampus,
          initialZoom: 15,
        ),

        children: [

          TileLayer(
            urlTemplate:
                "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
          ),

          MarkerLayer(
            markers: [

              Marker(
                point: kampus,
                width: 80,
                height: 80,
                child: const Icon(
                  Icons.location_on,
                  size: 40,
                  color: Colors.red,
                ),
              ),

              if (lokasiSaya != null)

                Marker(
                  point: lokasiSaya!,
                  width: 80,
                  height: 80,
                  child: const Icon(
                    Icons.person_pin_circle,
                    size: 40,
                    color: Colors.blue,
                  ),
                ),

            ],
          ),

        ],
      ),

      floatingActionButton:
          FloatingActionButton(

        backgroundColor:
            Colors.deepPurple,

        onPressed:
            moveToMyLocation,

        child:
            const Icon(Icons.my_location),

      ),
    );
  }
}