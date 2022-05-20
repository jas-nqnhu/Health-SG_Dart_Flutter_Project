import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapPage extends StatefulWidget {
  final LocationData userLocation;
  MapPage({Key key, this.userLocation}) : super(key: key);
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    CameraPosition _currentPos = CameraPosition(
      bearing: 0.0,
      target:
          LatLng(widget.userLocation.latitude, widget.userLocation.longitude),
      tilt: 60.0,
      zoom: 17,
    );
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _currentPos,
        mapType: MapType.normal,
        // myLocationButtonEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
