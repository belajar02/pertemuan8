import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class GoogleMapsPage extends StatefulWidget {
  const GoogleMapsPage({super.key});

  @override
  State<GoogleMapsPage> createState() => _GoogleMapsPageState();
}

class _GoogleMapsPageState extends State<GoogleMapsPage> {

  GoogleMapController? mapController;

  LatLng kampus = const LatLng(
    -6.200000,
    106.816666,
  );

  LatLng? lokasiSaya;

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  Future<void> getCurrentLocation() async {

    LocationPermission permission =
        await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission =
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

      mapController?.animateCamera(
        CameraUpdate.newLatLngZoom(
          lokasiSaya!,
          16,
        ),
      );

    }
  }

  @override
  Widget build(BuildContext context) {

    Set<Marker> markers = {

      Marker(
        markerId: const MarkerId("kampus"),
        position: kampus,
        infoWindow: const InfoWindow(
          title: "Lokasi Kampus",
        ),
      ),

    };

    if (lokasiSaya != null) {

      markers.add(

        Marker(
          markerId: const MarkerId("saya"),
          position: lokasiSaya!,
          infoWindow: const InfoWindow(
            title: "Lokasi Saya",
          ),
        ),

      );
    }

    return Scaffold(

      appBar: AppBar(
        title: const Text("Google Maps"),
        backgroundColor: Colors.deepPurple,
      ),

      body: GoogleMap(

        initialCameraPosition: CameraPosition(
          target: kampus,
          zoom: 15,
        ),

        myLocationEnabled: true,

        myLocationButtonEnabled: false,

        markers: markers,

        onMapCreated: (controller) {
          mapController = controller;
        },

      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: moveToMyLocation,
        child: const Icon(Icons.my_location),
      ),
    );
  }
}