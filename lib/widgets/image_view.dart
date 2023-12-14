import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageView extends StatelessWidget {
  late String? asset;
   ImageView({super.key, this.asset});

  @override
  Widget build(BuildContext context) {
    return PhotoView(
      imageProvider: AssetImage(asset!),
    );
  }
}