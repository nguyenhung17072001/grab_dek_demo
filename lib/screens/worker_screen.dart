import 'dart:io';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:grab_dek_demo/screens/host_map.dart';
import 'package:grab_dek_demo/screens/worker_map.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:grab_dek_demo/screens/map_sample.dart';
import 'package:image_picker/image_picker.dart';

class WorkerScreen extends StatefulWidget {
  const WorkerScreen({super.key});

  @override
  State<WorkerScreen> createState() => _WorkerScreenState();
}

class _WorkerScreenState extends State<WorkerScreen> {
  final myController = TextEditingController();
  final TextEditingController _addressValue = TextEditingController();
  final TextEditingController _constructionValue = TextEditingController();
  final TextEditingController _hostValue = TextEditingController();
  final TextEditingController _phoneValue = TextEditingController();

  late Position _currentPosition;
  late String _currentAddress;

  @override
  void initState() {
    super.initState();
    
    _getCurrentLocation();

    _addressValue.addListener(_printLatestValue);
  }

  void _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    _currentPosition = position;
    var url = Uri.https('nominatim.openstreetmap.org', '/reverse', {
      'format': 'json',
      'lat': position.latitude.toString(), 
      'lon': position.longitude.toString(),
    });
    var response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        var decodedBody =
            convert.jsonDecode(response.body) as Map<String, dynamic>;

        if (decodedBody.containsKey('address')) {
          var addressData = decodedBody['address'] as Map<String, dynamic>;

          // Accessing nested fields with proper error handling
          String quarter = addressData['quarter'] ?? '';
          String suburb = addressData['suburb'] ?? '';
          String city = addressData['city'] ?? '';

          setState(() {
            _addressValue.text = '$quarter, $suburb $city';
          });
          print('Address: ${_addressValue.text}');
        } else {
          print('Address data not found in the response.');
        }
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print('sssssssssssssssssssssssss: $e');
    }
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  void _printLatestValue() {
    final text = _addressValue.text;
    print(text);
  }

  File? _image;

  final ImagePicker _picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('Không chọn ảnh');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thợ'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage, // Gọi hàm để chọn ảnh
        tooltip: 'Chọn ảnh',
        child: const Icon(Icons.add_a_photo),
      ),
      body: Column(children: [
        Container(
          margin: const EdgeInsets.fromLTRB(10, 15, 10, 0),
          child: TextField(
            controller: _addressValue,
            decoration: const InputDecoration(
              labelText: 'Địa chỉ',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(10, 15, 10, 0),
          child: TextField(
            controller: _constructionValue,
            decoration: const InputDecoration(
              labelText: 'Địa bàn làm việc',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(10, 15, 10, 0),
          child: TextField(
            controller: _hostValue,
            decoration: const InputDecoration(
              labelText: 'Kinh nghiệm',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(10, 15, 10, 0),
          child: TextField(
            controller: _phoneValue,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Số điện thoại',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        _image == null
            ? const Text('Không có ảnh được chọn')
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.file(
                      _image!,
                      fit: BoxFit.cover,
                    )),
              ),
        Container(
          width: 200,
          child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              onPressed: () {
                /* Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MapSample()),
                ); */
                Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WorkerMap(
                    latitude: _currentPosition.latitude,
                    longitude: _currentPosition.longitude,
                  )
                ),
              );
              },
              child: Text('Tìm khách')),
        )
      ]),
    );
  }
}
