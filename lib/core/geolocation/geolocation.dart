import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyGeolocation extends StatefulWidget {
  const MyGeolocation({Key? key}) : super(key: key);

  @override
  _MyGeolocationState createState() => _MyGeolocationState();
}

class _MyGeolocationState extends State<MyGeolocation> {
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
  }

  void locatePosition() async {
    Position position = await _determinePosition();
    LatLng latLatPosition = LatLng(position.latitude, position.longitude);
    CameraPosition cameraPosition =
        CameraPosition(target: latLatPosition, zoom: 14);
    newGoogleMapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  late final GoogleMapController newGoogleMapController;

  static const CameraPosition _kLake = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(37.43296265331129, -122.08832357078792),
    tilt: 59.440717697143555,
    zoom: 19.151926040649414,
  );

  final List<Marker> markers = [];

  addMarker(cordinate) {
    int id = Random().nextInt(10);
    setState(() {
      markers.add(
        Marker(
          position: cordinate,
          markerId: MarkerId(id.toString()),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
          mapType: MapType.normal,
          myLocationButtonEnabled: false,
          myLocationEnabled: true,
          initialCameraPosition: _kLake,
          onMapCreated: (GoogleMapController controller) {
            newGoogleMapController = controller;
          },
          markers: markers.toSet(),
          onTap: (cordinate) {
            addMarker(cordinate);
            newGoogleMapController
                .animateCamera(CameraUpdate.newLatLng(cordinate));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          locatePosition();
        },
        child: const Icon(
          Icons.my_location_rounded,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
