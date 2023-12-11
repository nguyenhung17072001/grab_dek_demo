import 'package:flutter/material.dart';

class PositionedCircle extends StatelessWidget {
  late double ?right;    
  late double ?top;    
  late double ?bottom;    
  late double ?left; 
  late double ?width; 
  late double ?height; 
       
  late List<Color> ?colors;  
  PositionedCircle({super.key, 
    this.right,
    this.top,
    this.bottom,
    this.left,
    this.width,
    this.height,
    
  });

  @override
  Widget build(BuildContext context) {
      
    return Positioned(
      right: right,
      bottom: bottom,
      left: left,
      top: top,
      child: Opacity(
        opacity: 0.15,
        child: Container(
          width: width,
          height: height,
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
    );
  }
}
