import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    final currentPosition = Provider.of<Position>(context);
    // final markerService = MarkerService();
    return Center(
        child: Scaffold(
            body: Container(
      //Google map using providers which gets value from services and main class
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
            target: LatLng(0.31628,
                32.58219), //(currentPosition.latitude, currentPosition.longitude),
            zoom: 16.0),
        mapType: MapType.normal,
        zoomGesturesEnabled: true,
        myLocationEnabled: true,
        compassEnabled: true,
        // markers: Set<Marker>.of(markers),
      ),
    )));
  }
}
