import 'package:flutter/material.dart';
import 'package:grab_dek_demo/core/colors.dart';
import 'package:grab_dek_demo/widgets/info_field.dart';
import 'package:grab_dek_demo/widgets/positionedCircle.dart';

class Homeowner3 extends StatefulWidget {
  const Homeowner3({super.key});

  @override
  State<Homeowner3> createState() => _Homeowner3State();
}

class _Homeowner3State extends State<Homeowner3> {
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
            'Tìm kiếm vị trí',
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
              right: -40,
              bottom: -40,
              width: 180,
              height: 180,
            ),
            Positioned.fill(
              child: ListView(children: [
                
                Text('hunzzzz'),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(10, 15, 0, 0),
                          child: TextField(
                            controller: _addressValue,
                            decoration: const InputDecoration(
                              labelText: 'Vị trí công trình',
                              labelStyle: TextStyle(
                                fontFamily: 'Roboto-Regular',
                                color: Color(0xff3B3B3B),
                              ),
                              prefixIcon: Icon(
                                Icons.location_on,
                                color: AppColors.primaryColor,
                              ),
                              border:  OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.primaryColor),
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
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(vertical: 20.0),
                          child: TextButton.icon(
                            onPressed: () {}, 
                            icon: Center(
                              //padding: EdgeInsets.all(2),
                              child: Icon(Icons.map, color: AppColors.primaryColor),
                            ),
                            label: Text('')
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
