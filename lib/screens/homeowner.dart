import 'package:flutter/material.dart';
import 'package:grab_dek_demo/core/colors.dart';

class Homeowner extends StatefulWidget {
  const Homeowner({super.key});

  @override
  State<Homeowner> createState() => _HomeownerState();
}

class _HomeownerState extends State<Homeowner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          title: const Text('Chủ nhà tìm thợ'),
          actions: [],
        ),
        body: Stack(
          children: <Widget>[
            Positioned(
              left: -20,
              top: -20,
              child: Opacity(
                opacity: 0.15,
                child: Container(
                  width: 100,
                  height: 100,
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
              ),
            ),
            Positioned(
              right: -40,
              bottom: -40,
              child: Opacity(
                opacity: 0.15,
                child: Container(
                  width: 180,
                  height: 180,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
