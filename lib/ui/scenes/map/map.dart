import 'dart:async';
import 'dart:ui' as ui;
import 'dart:typed_data';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:googlemaps_gdansk/core/services/i18n.dart';
import 'package:googlemaps_gdansk/core/services/data.dart';


class MapView extends StatefulWidget {
  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  Completer<GoogleMapController> _controller = Completer();
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  HistoryPoint selectedPoint;

  static final CameraPosition _neptunesFountain = CameraPosition(
    target: LatLng(54.3485324, 18.6522253), // near Neptune's Fountain in Gdansk
    zoom: 14.4746,
  );

  void initState() {
    askForLocation();
    setMarkers();
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('You visited 0 places'),
        centerTitle: true,
      ),
      body: Stack(children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: GoogleMap(
            mapType: MapType.normal,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            mapToolbarEnabled: true,
            initialCameraPosition: _neptunesFountain,
            markers: Set<Marker>.of(markers.values),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            }
          )
        ),
        selectedPoint != null ?
          Positioned(
            bottom: 80,
            left: 50,
            child: GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'history_details', arguments: selectedPoint.id),
              child: Container(
                padding: EdgeInsets.all(5.0),
                width: MediaQuery.of(context).size.width - 100,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0)
                ),
                child: Column(
                  children: <Widget>[
                    Text(
                      i18n.text(selectedPoint.name),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontFamily: "Montserrat-Black",
                        letterSpacing: 1.0)
                    )
                  ],
                )
              ),
            )
          ) : null
      ].where((child) => child != null).toList() )
    );
  }

  void askForLocation () async {
    // TODO: ask for geolocation before going to google maps
    await Geolocator().checkGeolocationPermissionStatus();
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    final CameraPosition _center = CameraPosition(
      bearing: 0.0,
      target: LatLng(position.latitude, position.longitude),
      tilt: 0.0,
      zoom: 18);

    final GoogleMapController controller = await _controller.future;
    //controller.animateCamera(CameraUpdate.newCameraPosition(_center));
  }

  void setMarkers () async {
    for(HistoryPoint point in historyPoints.values) {
      var markerId = MarkerId(point.id);
      final Uint8List markerIcon = await getBytesFromAsset('assets/flag-pl.png', 100);
        markers[markerId] = Marker(
          markerId: MarkerId(point.id),
          icon: BitmapDescriptor.fromBytes(markerIcon),
          position: LatLng( point.latitude, point.longitude ),
          onTap: () {
            setState((){
              selectedPoint = point;
            });
          }
        );
    }
    setState((){});
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png)).buffer.asUint8List();
  }
}