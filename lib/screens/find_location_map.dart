import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:grab_dek_demo/core/colors.dart';

class LocationMap extends StatefulWidget {
  const LocationMap({super.key});

  @override
  State<LocationMap> createState() => _LocationMapState();
}

class _LocationMapState extends State<LocationMap> {
  late CameraPosition _kGooglePlex = CameraPosition(
    zoom: 16,
    target: LatLng(21.07897972618073, 105.76329371732743)
  );


  

  Set<Marker> _markers = {};
  Set<Circle> _circles = {};

  @override
  void initState() {
    //_getLocation();
    super.initState();
    _goCurrentPosition();
  }
  void _addCircle() {
    
  
    _circles.add(
      Circle(
        circleId: const CircleId("CurrentCircle"),
        center: LatLng(21.07897972618073, 105.76329371732743),
        radius: 20, 
        fillColor: Colors.blue.withOpacity(0.3),
        strokeWidth: 1,
        strokeColor: Colors.blue,
      ),
    );
    setState(() {
      
    });
     
  }

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();



  Future<void> _goCurrentPosition() async {
    try {
      print("sssssss hunggggggggggggggggg");
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      print("sssssss ${position}");
      final GoogleMapController controller = await _controller.future;
      await controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(position.latitude, position.longitude),
          zoom: 15,
        ),
      ));
      setState(() {
        
      });
      
    } catch (e) {
      print('eerrrrr: ${e}');
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          
          onMapCreated: (GoogleMapController controller) async {
            //_goCurrentPosition();
            _addCircle();

          },
          markers: _markers,
          circles: _circles,
        ),
      ),
    );
  }
}