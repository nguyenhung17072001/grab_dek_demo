import 'package:flutter/material.dart';
import 'package:grab_dek_demo/core/colors.dart';
import 'package:grab_dek_demo/widget/positionedCircle.dart';

class Homeowner2 extends StatefulWidget {
  const Homeowner2({super.key});

  @override
  State<Homeowner2> createState() => _Homeowner2State();
}

class _Homeowner2State extends State<Homeowner2> {
  final TextEditingController _constructionNameValue = TextEditingController();
  final TextEditingController _addressValue = TextEditingController();

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
            'Tìm thợ thi công',
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
              child: ListView(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: const Text(
                        'Thông tin công trình',
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
                   
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                      child: TextField(
                        controller: _constructionNameValue,
                        decoration: const InputDecoration(
                          labelText: 'Tên công trình',
                          labelStyle: TextStyle(
                            fontFamily: 'Roboto-Regular',
                            color: Color(0xff3B3B3B),
                          ),
                          prefixIcon: Icon(
                            Icons.business,
                            color: AppColors.primaryColor,
                          ),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.primaryColor),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffE6E6E6))),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                      child: TextField(
                        controller: _addressValue,
                        decoration: const InputDecoration(
                          labelText: 'Địa chỉ công trình',
                          labelStyle: TextStyle(
                            fontFamily: 'Roboto-Regular',
                            color: Color(0xff3B3B3B),
                          ),
                          prefixIcon: Icon(
                            Icons.location_searching_sharp,
                            color: AppColors.primaryColor,
                          ),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.primaryColor),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffE6E6E6))),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ảnh công trình',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Roboto-Regular'
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                //color: Colors.white,
                                border: Border(
                                  
                                ),
                                borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(10),
                                  right: Radius.circular(10),
                                ),
                              ),
                            width: MediaQuery.of(context).size.width*0.4,
                            height: 100,
                            child: TextButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                side: MaterialStateProperty.all<BorderSide>(
                                    const BorderSide(
                                      color: Color(0xffE6E6E6),
                                      width: 1.0,
                                    ),
                                  ),
                              ),
                              child: Icon(
                                Icons.image,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          )
                        ]
                      ),
                    ),

                    Container(
                      margin: const EdgeInsets.symmetric(
                                      vertical: 20.0),
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
                                      color: AppColors
                                          .primaryColor, 
                                      width: 1.0,
                                    ),
                                  ),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          10.0), 
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 12.0),
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
                                onPressed: () {
                                  
                                  },
                                style: ButtonStyle(
                                  overlayColor: MaterialStateProperty.all<Color>(
                                    Colors.white,
                                  ),
                                ),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 12.0),
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
