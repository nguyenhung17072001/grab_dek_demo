import 'dart:async';

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:grab_dek_demo/core/colors.dart';
import 'package:grab_dek_demo/models/worker.dart';
import 'package:grab_dek_demo/widgets/radar.dart';
import 'package:grab_dek_demo/widgets/worker_details_modal.dart';
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
  double previousZoom = 0.0;
  bool agentsMarkersVisible = false;
  bool _showRadar = true;



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
    {"name": "Thợ 11", "lat": "21.079555761649814", "lon": "105.76645631143114"},
    {"name": "Thợ 12", "lat": "21.076949161664054", "lon": "105.7644589622496"},
    {"name": "Thợ 13", "lat": "21.07907989149371", "lon": "105.75964916398519"},
    {"name": "Thợ 14", "lat": "21.07900910361037", "lon": "105.76667420056475"},
    {"name": "Thợ 15", "lat": "21.083192402956687", "lon": "105.76327197033433"},
  ];
  static const List<dynamic> agents = [
    {"name": "Đại lý 2", "lat": "21.001220", "lon": "105.828733"},
    {"name": "Đại lý 3", "lat": "20.992646", "lon": "105.828819"},
    {"name": "Đại lý 4", "lat": "20.990201", "lon": "105.841393"},
    {"name": "Đại lý 5", "lat": "21.078176", "lon": "105.778934"},
    {"name": "Đại lý 6", "lat": "21.081743", "lon": "105.766934"},
    {"name": "Đại lý 7", "lat": "21.010435", "lon": "105.857515"},
    {"name": "Đại lý 8", "lat": "21.024529", "lon": "105.854606"},
    {"name": "Đại lý 9", "lat": "20.999214", "lon": "105.837240"},
    {"name": "Đại lý 10", "lat": "20.990335", "lon": "105.851740"},
    {"name": "Đại lý 10", "lat": "21.0758592528179", "lon": "105.77358827401852"},
    {"name": "Đại lý 10", "lat": "21.081811788215273", "lon": "105.77226135799428"},
    {"name": "Đại lý 10", "lat": "21.07061907953696", "lon": "105.76438564385785"},
  ];


  Set<Marker> _markers = {};
  Set<Circle> _circles = {};
  @override
  void initState() {
    _latitude = widget.latitude;
    _longitude = widget.longitude;
    _kGooglePlex = CameraPosition(
      target: LatLng(_latitude, _longitude),
      zoom: 14,
    );
    _setRadarRadius();
    _setRadar();
    super.initState();
  }
  @override
  void dispose() {
  
    super.dispose();
  }
  void _setRadar () {
    Timer(Duration(milliseconds : 4000), () {
      setState(() {
        _showRadar = false;
      });
    });
  }
  void _setRadarRadius () {
    const double targetValue = 1000;
    const double durationInSeconds = 1.8;
    const int updateFrequencyInMilliseconds = 40;
    Timer.periodic(const Duration(milliseconds: updateFrequencyInMilliseconds), (Timer timer) {
      setState(() {
        if (radarRadius < targetValue) {
          radarRadius += (targetValue / (durationInSeconds * 1000 / updateFrequencyInMilliseconds));

          
          Circle? radarCircle = _circles.firstWhere(
            (circle) => circle.circleId == const CircleId("radar"),
            orElse: () => const Circle(circleId: CircleId("none")), 
          );

          if (radarCircle.circleId != const CircleId("none")) {
            _circles.remove(radarCircle); 
            _circles.add(
              Circle(
                circleId: const CircleId("radar"),
                center: LatLng(_latitude, _longitude),
                radius: radarRadius, 
                fillColor: AppColors.primaryColor.withOpacity(0.1),
                strokeWidth: 1,
                strokeColor: AppColors.primaryColor,
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

  
  void _addRadar() {
    
  
    _circles.add(
      Circle(
        circleId: const CircleId("radar"),
        center: LatLng(_latitude, _longitude),
        radius: radarRadius, 
        fillColor: AppColors.primaryColor.withOpacity(0.1),
        strokeWidth: 1,
        strokeColor: AppColors.primaryColor,
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
              showDragHandle: true,
              useSafeArea: true,
              isDismissible: true,
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
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
  void _addAgentsMarkers(List<dynamic> agents) async {
    for (var agent in agents) {
      double lat = double.parse(agent['lat'].toString());
      double lon = double.parse(agent['lon'].toString());

      _markers.add(
        Marker(
          markerId: MarkerId(agent['name']),
          position: LatLng(lat, lon),
          icon: await MarkerIcon.pictureAsset(
            assetPath:
                'lib/assets/icons/agent.png', 
            width: 140,
            height: 140,
          ),
          infoWindow: InfoWindow(
            title: agent['name'],
            snippet:
                "Worker's details here", 
          ),
          onTap: () {
            
          },
        ),
      );
    }
    setState(() {});
  }
  void _addAgentsMarkers2(List<dynamic> agents) async {
    for (var agent in agents) {
      double lat = double.parse(agent['lat'].toString());
      double lon = double.parse(agent['lon'].toString());

      _markers.add(
        Marker(
          markerId: MarkerId(agent['name']),
          position: LatLng(lat, lon),
          icon: await MarkerIcon.pictureAsset(
            assetPath:
                'lib/assets/icons/agent_location.png', 
            width: 80,
            height: 80,
          ),
          infoWindow: InfoWindow(
            title: agent['name'],
            snippet:
                "Worker's details here", 
          ),
          onTap: () {
            
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
      body: Stack(
        children: [
          
          Positioned.fill(
          
          child: GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) async {
              _controller.complete(controller);
              _addHostMarker();
              _addWorkerMarkers(wokers);
              //_addAgentsMarkers(agents);
              //_addCircle();
              _addRadar();
              _addAgentsMarkers2(agents);
              
      
              //_addWorkerMarkers(workers);
             
            },
           
            onCameraMove: (CameraPosition position) {
              final double zoomLevel = position.zoom;
              print('Độ zoom hiện tại: $zoomLevel');
              print("zzzzzzz: $agentsMarkersVisible");
              if ((previousZoom <= 14.5 && zoomLevel > 14.5) ||
                  (previousZoom > 14.5 && zoomLevel <= 14.5)) {
                setState(() {
                  agentsMarkersVisible = zoomLevel > 14.5;
                });

                
      
                if (agentsMarkersVisible) {
                  _addAgentsMarkers(agents);
                  //_markers.removeWhere((marker) => agents.any((agent) => marker.markerId.value == '${agent['name']}2'));
                } else {
                  _addAgentsMarkers2(agents);
                  //_markers.removeWhere((marker) => agents.any((agent) => marker.markerId.value == agent['name']));
                }
              }
              previousZoom = zoomLevel;
            },
            
            markers: _markers,
            circles: _circles,
          ),
        ),
        if (_showRadar)
            Positioned.fill(
              child: RadarWidget(),
            ),
        
        ]
      ),
    );
  }

  
}
