import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({Key? key, required this.isActive, required this.color}) : super(key: key);

  final bool isActive;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isActive ?  CircleAvatar(
      backgroundColor: Colors.white,
      radius: 32,
      child: CircleAvatar(
          backgroundColor: color,
          radius: 26,),
    ): CircleAvatar(
      backgroundColor: color,
      radius: 32,
    );
  }
}
