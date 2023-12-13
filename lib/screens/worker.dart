import 'package:flutter/material.dart';
import 'package:grab_dek_demo/core/colors.dart';
import 'package:grab_dek_demo/screens/homeowner_3.dart';
//import 'package:grab_dek_demo/screens/Worker_2.dart';
import 'package:grab_dek_demo/widgets/info_field.dart';
import 'package:grab_dek_demo/widgets/positionedCircle.dart';

class Worker extends StatefulWidget {
  const Worker({super.key});

  @override
  State<Worker> createState() => _WorkerState();
}

class _WorkerState extends State<Worker> {
  final TextEditingController _nameValue = TextEditingController();
  final TextEditingController _phoneValue = TextEditingController();
  final TextEditingController _radiusValue = TextEditingController();

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
                    'Thông tin cá nhân',
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
                        color: const Color(0xffE6E6E6),
                      ),
                      Container(
                        height: 16,
                        width: 16,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffE6E6E6),
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton.icon(
                  onPressed: () {
                
                  }, 
                  icon: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xffE6E6E6),
                        width: 1,
                      ),
                      //color: Colors.red,
                      borderRadius: BorderRadius.circular(10.0), 
                    ),
                    width: MediaQuery.of(context).size.width*0.4,
                    height: MediaQuery.of(context).size.height*0.25,
                    child: Image.asset(
                      'lib/assets/icons/user_picker.png',
                      fit: BoxFit.contain,
                    )
                  ), 
                  label: const Text(''),
                ),
                InfoField(
                  labelText: 'Họ và tên',
                  controller: _nameValue,
                  icon: Icons.person,
                ),
                InfoField(
                  labelText: 'Số điện thoại',
                  controller: _phoneValue,
                  icon: Icons.phone,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                  alignment: AlignmentDirectional.centerStart,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: const Color(0xffE6E6E6),
                    ),
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: TextButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Homeowner3()));
                    },
                    icon: const Icon(
                      Icons.gps_fixed,
                      color: AppColors.primaryColor,
                    ),
                    label: Container(
                      margin: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                      width: double.infinity,
                      child: const Text(
                        'Địa chỉ hoạt động',
                        style: TextStyle(
                          fontFamily: 'Roboto-Regular',
                          fontSize: 16,
                          color: Color(0xff3B3B3B),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Container(
                          height: 60,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: _radiusValue,
                            decoration: const InputDecoration(
                              labelText: 'Bán kính hoạt động',
                              labelStyle:  TextStyle(
                                fontFamily: 'Roboto-Regular',
                                color: Color(0xff3B3B3B),
                              ),
                              prefixIcon: Icon(
                                Icons.location_searching,
                                color: AppColors.primaryColor,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.zero)
                              ),
                              focusedBorder:  OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.primaryColor),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xffE6E6E6))),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          
                          decoration: const BoxDecoration(
                            color: Color(0xffF0F0F0),
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(4),
                              right: Radius.circular(4),
                            
                            ),
                            
                
                        ),
                        alignment: Alignment.center,
                        height: 60,
                        width: 100,
                        child: const Text('Km', style: TextStyle(color: Color(0xffB8B8B8), fontSize: 14, fontFamily: 'Roboto-Regular'),),
                      )
                      )
                    ],
                  ),
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
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Container()));
                            },
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
