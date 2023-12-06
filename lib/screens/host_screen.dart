import 'dart:io';

import 'package:flutter/material.dart';
import 'package:grab_dek_demo/screens/map_sample.dart';
import 'package:image_picker/image_picker.dart';

class HostScreen extends StatefulWidget {
  const HostScreen({super.key});

  @override
  State<HostScreen> createState() => _HostScreenState();
}

class _HostScreenState extends State<HostScreen> {
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    myController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    myController.dispose();
    super.dispose();
  }

  void _printLatestValue() {
    final text = myController.text;
    print('Second text field: $text (${text.characters.length})');
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
       
       title: Text('Chủ nhà'), 
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage, // Gọi hàm để chọn ảnh
        tooltip: 'Chọn ảnh',
        child: Icon(Icons.add_a_photo),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(10, 15, 10, 0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Địa chỉ',
                border: OutlineInputBorder(),
                
              ),
              onChanged: (text) {
                print('First text field: $text (${text.characters.length})');
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(10, 15, 10, 0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Địa chỉ',
                border: OutlineInputBorder(),
                
              ),
              onChanged: (text) {
                print('First text field: $text (${text.characters.length})');
              },
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
                )
              ),
            ),
          Container(
            width: 200,
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MapSample()),
                );
              },
              child: Text('Tìm thợ')
            ),
          )
          
        ]),
    );
  }
}