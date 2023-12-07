import 'dart:async';

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:grab_dek_demo/models/worker.dart';
import 'package:marker_icon/marker_icon.dart';

class HostMap extends StatefulWidget {
  final double latitude;
  final double longitude;
  HostMap({Key? key, required this.latitude, required this.longitude})
      : super(key: key);

  @override
  State<HostMap> createState() => HostMapState();
}

class HostMapState extends State<HostMap> {
  late double _latitude;
  late double _longitude;
  late CameraPosition _kGooglePlex;
  late BitmapDescriptor hostIcon;
  
  static const List<dynamic> wokers = [
    {
      "name": "Thợ 1",
      "lat": "21.0154722",
      "lon": "105.855"
    },
    {
      "name": "Thợ 2",
      "lat": "21.014599",
      "lon": "105.851642"
    },
    {
      "name": "Thợ 3",
      "lat": "21.015922",
      "lon": "105.859339"
    },
    {
      "name": "Thợ 4",
      "lat": "21.017581",
      "lon": "105.855529"
    },
    {
      "name": "Thợ 5",
      "lat": "21.009929716805722",
      "lon": "105.84106206806747"
    },
    {
      "name": "Thợ 6",
      "lat": "21.009929716805722",
      "lon": "105.84106206806747"
    },
    {
      "name": "Thợ 7",
      "lat": "21.014211855697347",
      "lon": "105.84902786667328"
    },
    {
      "name": "Thợ 8",
      "lat": "20.983579",
      "lon": "105.849482"
    },
    {
      "name": "Thợ 9",
      "lat": "20.988025",
      "lon": "105.841313"
    },
    {
      "name": "Thợ 10",
      "lat": "21.000263",
      "lon": "105.832091"
    },

  ];
 

  
  Set<Marker> _markers = {};

  @override
  void initState() {
   
    _latitude = widget.latitude;
    _longitude = widget.longitude;
    _kGooglePlex = CameraPosition(
      target: LatLng(_latitude, _longitude),
      zoom: 15,
    );
   
  
    super.initState();
  }

  void _addHostMarker() async {
    _markers.add(
      Marker(
        markerId: const MarkerId("kGooglePlexMarker"),
        position: LatLng(_latitude, _longitude),
        icon: await MarkerIcon.pictureAsset(
          assetPath: 'lib/assets/icons/house_icon.png',
          width: 120,
          height: 120,
        ),
        infoWindow: const InfoWindow(
          title: "Chủ nhà",
          snippet: "Chủ nhà đi tìm thợ",
        ),
      ),
    );
    setState(() {

    });
  }
  void _addWorkerMarkers(List<dynamic> workers) async {
  for (var worker in workers) {
    double lat = double.parse(worker['lat'].toString());
    double lon = double.parse(worker['lon'].toString());

    _markers.add(
      Marker(
        markerId: MarkerId(worker['name']),
        position: LatLng(lat, lon),
        icon: await MarkerIcon.pictureAsset(
          assetPath: 'lib/assets/icons/worker_icon.png', // Change to your worker icon path
          width: 120,
          height: 120,
        ),
        infoWindow: InfoWindow(
          title: worker['name'],
          snippet: "Worker's details here", // You can add worker-specific information here
        ),
      ),
    );
  }
  setState(() {});
}


  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kLake = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(37.43296265331129, -122.08832357078792),
    zoom: 19.151926040649414,
  );

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
            _controller.complete(controller);
            _addHostMarker(); 
            _addWorkerMarkers(wokers);

            
            //_addWorkerMarkers(workers);
          },
          markers: _markers,
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('To the lake!'),
        icon: const Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }


  
}
