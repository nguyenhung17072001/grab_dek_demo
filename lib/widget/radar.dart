import 'dart:math';
import 'package:flutter/material.dart';

class RadarWidget extends StatefulWidget {
  @override
  _RadarWidgetState createState() => _RadarWidgetState();
}

class _RadarWidgetState extends State<RadarWidget>
  with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      height: 200.0,
      child: CustomPaint(
        painter: RadarPainter(_controller.value),
      ),
    );
  }
}

class RadarPainter extends CustomPainter {
  final double animationValue;

  RadarPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final paint = Paint()
      ..color = Colors.blue.withOpacity(0.5)
      ..style = PaintingStyle.stroke;

    final numberOfCircles = 6;
    for (int i = 0; i < numberOfCircles; i++) {
      canvas.drawCircle(
        center,
        size.width / numberOfCircles * (i + 1) * animationValue,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
