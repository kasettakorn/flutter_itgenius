// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_scale/models/locations.dart' as location;

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(13.782753061840266, 100.5465259112943);

  final Map<String, Marker> _markers = {};
  Future<void> _onMapCreated(GoogleMapController controller) async {
    // final googleOffices = await location.getGoogleOffices();
    setState(() {
      _markers.clear();
      // for (final office in googleOffices.offices) {
      //   final marker = Marker(
      //     markerId: MarkerId(office.name),
      //     position: LatLng(office.lat, office.lng),
      //     infoWindow: InfoWindow(
      //       title: office.name,
      //       snippet: office.address,
      //     ),
      //   );
      //   _markers[office.name] = marker;
      // }

      final marker = Marker(
        markerId: MarkerId('Paholyothin Place Plaza'),
        position: _center,
      );
      _markers['Paholyothin Place Plaza'] = marker;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ข้อมูลติดต่อ'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 17.0,
        ),
        mapType: MapType.normal,
        trafficEnabled: true,
        markers: _markers.values.toSet(),
      ),
    );
  }
}
