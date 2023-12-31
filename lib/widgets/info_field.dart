import 'package:flutter/material.dart';
import 'package:grab_dek_demo/core/colors.dart';

class InfoField extends StatefulWidget {
  late TextEditingController? controller;
  late String? labelText;
  late IconData? icon;
  late TextInputType? keyboardType;

  InfoField({
    super.key,  
    this.controller, 
    required this.labelText, 
    this.icon,
    this.keyboardType,
  });

  @override
  State<InfoField> createState() => _InfoFieldState();
}

class _InfoFieldState extends State<InfoField> {
  late TextEditingController? _controller;
  late String? _labelText;
  late IconData? _icon;
  late TextInputType? _keyboardType;

  @override
  void initState() {
    _controller = widget.controller;
  
    _labelText = widget.labelText;
    _icon = widget.icon;
    _keyboardType = widget.keyboardType;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 15, 10, 0),
      child: TextField(
        controller: _controller,
        keyboardType: _keyboardType?? TextInputType.text,
        decoration: InputDecoration(
          labelText: _labelText,
          labelStyle: const TextStyle(
            fontFamily: 'Roboto-Regular',
            color: Color(0xff3B3B3B),
          ),
          prefixIcon: Icon(
            _icon,
            color: AppColors.primaryColor,
          ),
          border: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryColor),
          ),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffE6E6E6))),
        ),
      ),
    );
  }
}
