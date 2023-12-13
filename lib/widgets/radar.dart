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
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120.0,
      height: 120.0,
      child: CustomPaint(
        painter: RadarPainter(_controller),
      ),
    );
  }
}

class RadarPainter extends CustomPainter {
  final AnimationController animationController;

  RadarPainter(this.animationController) : super(repaint: animationController);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final paint = Paint()
      ..color = Colors.blue.withOpacity(0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.6;

    final radius = size.width / 3;

    final sweepAngle = animationController.value * 2 * pi;

    canvas.drawCircle(center, radius, paint);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      sweepAngle,
      false,
      paint,
    );

    canvas.drawLine(
      center,
      Offset(
        center.dx + cos(-pi / 2 + sweepAngle) * radius,
        center.dy + sin(-pi / 2 + sweepAngle) * radius,
      ),
      paint..color = Colors.blue,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
