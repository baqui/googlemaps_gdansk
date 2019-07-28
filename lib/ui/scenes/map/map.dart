import 'dart:async';
import 'package:location/location.dart';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class MapView extends StatefulWidget {
  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  Completer<GoogleMapController> _controller = Completer();

  LocationData _currentLocation;
  StreamSubscription<LocationData> _locationSubscription;
  var _locationService = new Location();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(54.537435, 18.482041),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  void initState() {
    super.initState();
    initPlatformState();

    _locationSubscription = _locationService
        .onLocationChanged()
        .listen((LocationData currentLocation) async {
      setState(() {
        _currentLocation = currentLocation;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: GoogleMap(
          mapType: MapType.normal,
          myLocationEnabled: true,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
    ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('To the lake!'),
        icon: Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  void initPlatformState() async {
    try {
      _currentLocation = await _locationService.getLocation();

    } catch (e) {
      print("Location error");
    }
  }
}