import 'dart:async';

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:grab_dek_demo/models/worker.dart';
import 'package:grab_dek_demo/widget/worker_details_modal.dart';
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
  late double radarRadius = 0;

  
  static const List<dynamic> wokers = [
    {"name": "Thợ 2", "lat": "21.014599", "lon": "105.851642"},
    {"name": "Thợ 3", "lat": "21.015922", "lon": "105.859339"},
    {"name": "Thợ 4", "lat": "21.017581", "lon": "105.855529"},
    {"name": "Thợ 5", "lat": "21.009929716805722", "lon": "105.84106206806747"},
    {"name": "Thợ 6", "lat": "21.009929716805722", "lon": "105.84106206806747"},
    {"name": "Thợ 7", "lat": "21.014211855697347", "lon": "105.84902786667328"},
    {"name": "Thợ 8", "lat": "20.983579", "lon": "105.849482"},
    {"name": "Thợ 9", "lat": "20.988025", "lon": "105.841313"},
    {"name": "Thợ 10", "lat": "21.000263", "lon": "105.832091"},
  ];


  Set<Marker> _markers = {};
  Set<Circle> _circles = {};
  @override
  void initState() {
    _latitude = widget.latitude;
    _longitude = widget.longitude;
    _kGooglePlex = CameraPosition(
      target: LatLng(_latitude, _longitude),
      zoom: 14.5,
    );
    _setRadarRadius();
  

    super.initState();
  }
  void _setRadarRadius () {
    const double targetValue = 1000;
    const double durationInSeconds = 1.8;
    const int updateFrequencyInMilliseconds = 40;
    Timer.periodic(Duration(milliseconds: updateFrequencyInMilliseconds), (Timer timer) {
      setState(() {
        if (radarRadius < targetValue) {
          radarRadius += (targetValue / (durationInSeconds * 1000 / updateFrequencyInMilliseconds));

          
          Circle? radarCircle = _circles.firstWhere(
            (circle) => circle.circleId == CircleId("radar"),
            orElse: () => Circle(circleId: CircleId("none")), 
          );

          if (radarCircle.circleId != CircleId("none")) {
            _circles.remove(radarCircle); 
            _circles.add(
              Circle(
                circleId: CircleId("radar"),
                center: LatLng(_latitude, _longitude),
                radius: radarRadius, 
                fillColor: Colors.blue.withOpacity(0.1),
                strokeWidth: 1,
                strokeColor: Colors.blue,
              ),
            );
          }
        } else {
          radarRadius = targetValue;
          timer.cancel(); 
        }
      });
    });
  }

  void _addCircle() {
    const double radius = 1000;
    _circles.add(
      Circle(
        circleId: const CircleId("distance"),
        center: LatLng(_latitude, _longitude),
        radius: radius, 
        fillColor: Colors.blue.withOpacity(0.1),
        strokeWidth: 1,
        strokeColor: Colors.blue,
      ),
    );
    setState(() {
      
    });
     
  }
  void _addRadar() {
    
  
    _circles.add(
      Circle(
        circleId: const CircleId("radar"),
        center: LatLng(_latitude, _longitude),
        radius: radarRadius, 
        fillColor: Colors.blue.withOpacity(0.1),
        strokeWidth: 1,
        strokeColor: Colors.blue,
      ),
    );
    setState(() {
      
    });
     
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

    setState(() {});
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
            assetPath:
                'lib/assets/icons/worker_icon.png', 
            width: 120,
            height: 120,
          ),
          infoWindow: InfoWindow(
            title: worker['name'],
            snippet:
                "Worker's details here", 
          ),
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return WorkerDetailsModal(
                  name: worker['name'],
                  snippet:
                      "Các thông tin, thông số của thợ", 
                );
              },
            );
          },
        ),
      );
    }
    setState(() {});
  }

  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();


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
            //_addCircle();
            _addRadar();

            

            //_addWorkerMarkers(workers);
           
          },
         
          onCameraMove: (CameraPosition position) {
            final double zoomLevel = position.zoom;
            print('Độ zoom hiện tại: $zoomLevel');
            
          },
          
          markers: _markers,
          circles: _circles,
        ),
      ),
    );
  }

  
}
