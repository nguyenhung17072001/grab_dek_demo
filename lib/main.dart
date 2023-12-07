// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import 'navigation/bottom_tab.dart';
import 'package:geolocator/geolocator.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<void> _requestPermission() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {

      bool openSettings = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Yêu cầu quyền vị trí'),
            content: const Text('Ứng dụng cần truy cập vị trí để hoạt động.'),
            actions: <Widget>[
              TextButton(
                child: const Text('Đồng ý'),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
              TextButton(
                child: const Text('Cài đặt'),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
            ],
          );
        },
      );

      if (openSettings) {
        await Geolocator.openAppSettings();
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _requestPermission();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BottomTab(),
    );
  }
}
