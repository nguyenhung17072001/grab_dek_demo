import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:grab_dek_demo/core/colors.dart';
import 'package:grab_dek_demo/screens/homeowner_3.dart';
import 'package:grab_dek_demo/screens/host_map.dart';
import 'package:grab_dek_demo/screens/worker_map.dart';
import 'package:grab_dek_demo/widgets/info_field.dart';
import 'package:grab_dek_demo/widgets/positionedCircle.dart';
import 'package:image_picker/image_picker.dart';

class Worker2 extends StatefulWidget {
  const Worker2({super.key});

  @override
  State<Worker2> createState() => _Worker2State();
}

class _Worker2State extends State<Worker2> {
  final TextEditingController _experienceValue = TextEditingController();
  final TextEditingController _certificateValue = TextEditingController();
  late Position _currentPosition;
  late final List<File> _images = [];
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    // Start listening to changes.
    //_getCurrentLocation();

  }

  @override
  void setState(VoidCallback fn) { 
    super.setState(fn);
    
  }
  void _getMap()  {
      Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high).then((value) => {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WorkerMap(
              latitude: value.latitude,
              longitude: value.longitude,
            )
          ),
        )
      });
    
    
    
  }
  Future getImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _images.add(File(pickedFile.path));
      } else {
        print('Không chọn ảnh');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            'Thông tin thợ thi công',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Roboto-Bold',
              fontSize: 14,
            ),
          ),
          elevation: 1,
          shadowColor: const Color(0xffF0F0F0),
          leading: IconButton(
            icon: const Icon(
              Icons.chevron_left,
              size: 26,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            color: Colors.black,
          ),
          actions: [],
        ),
        body: Stack(
          children: <Widget>[
            PositionedCircle(
              top: -20,
              left: -20,
              width: 120,
              height: 120,
            ),
            PositionedCircle(
              right: -40,
              bottom: -40,
              width: 180,
              height: 180,
            ),
            Positioned.fill(
              child: ListView(children: [
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: const Text(
                    'Chứng chỉ nghề nghiệp',
                    style: TextStyle(
                      fontFamily: 'Roboto-Regular',
                      fontSize: 14,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 16,
                        width: 16,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                              Color(0xffFFF100),
                              Color(0xffFFB57E),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 2,
                        width: 130,
                        decoration: const BoxDecoration(
                          //shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                              Color(0xffFFF100),
                              Color(0xffFFB57E),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 16,
                        width: 16,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                              Color(0xffFFF100),
                              Color(0xffFFB57E),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                InfoField(
                  keyboardType: TextInputType.number,
                  controller: _experienceValue,
                  labelText: 'Số năm kinh nghiệm',
                  icon: Icons.business,
                ),
                
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                      child: const Text(
                        'Chứng chỉ',
                        style: TextStyle(
                            color: Colors.black, fontFamily: 'Roboto-Regular'),
                      ),
                    ),
                    InfoField(
                      keyboardType: TextInputType.text,
                      controller: _certificateValue,
                      labelText: 'Tên chứng chỉ',
                      icon: Icons.business,
                    ),
                    Container(
                      //margin: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                      height: _images.isNotEmpty ? 100 : 0,
                      child: _images.isNotEmpty
                          ? ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: _images.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: 100,
                                    width: MediaQuery.of(context).size.width * 0.28,
                                    child: Image.file(
                                      _images[index],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              },
                            )
                          : null,
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      decoration: const BoxDecoration(
                        border: Border(),
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(8),
                          right: Radius.circular(8),
                        ),
                      ),
                      width: MediaQuery.of(context).size.width * 0.28,
                      height: 100,
                      child: TextButton(
                        onPressed: getImage,
                        style: ButtonStyle(
                          side: MaterialStateProperty.all<BorderSide>(
                            const BorderSide(
                              color: Color(0xffE6E6E6),
                              width: 1.0,
                            ),
                          ),
                        ),
                        child: const Icon(
                          Icons.image,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                            style: ButtonStyle(
                              side: MaterialStateProperty.all<BorderSide>(
                                const BorderSide(
                                  color: AppColors.primaryColor,
                                  width: 1.0,
                                ),
                              ),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 12.0),
                                child: Center(
                                  child: Text(
                                    'Quay lại',
                                    style: TextStyle(
                                      fontFamily: 'Roboto-Medium',
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(10),
                              right: Radius.circular(10),
                            ),
                          ),
                          child: TextButton(
                            onPressed: _getMap,
                            style: ButtonStyle(
                              overlayColor: MaterialStateProperty.all<Color>(
                                Colors.white,
                              ),
                            ),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 12.0),
                                child: Center(
                                  child: Text(
                                    'Tiếp tục',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
