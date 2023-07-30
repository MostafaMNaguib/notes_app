import 'package:flutter/material.dart';
import 'package:notes_app/utils/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key,required this.hintText,this.maxLines = 1 }) : super(key: key);

  final String hintText;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: primaryColor,
      decoration: InputDecoration(
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(primaryColor),
        hintText: hintText,
        hintStyle: const TextStyle(color: primaryColor),
      ),
      maxLines: maxLines,
    );
  }

  OutlineInputBorder buildBorder([color]){
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
            color: color ?? Colors.white,
            style: BorderStyle.solid
        )
    );
  }

}
