import 'package:flutter/material.dart';
import 'package:notes_app/utils/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: primaryColor,
      decoration: InputDecoration(
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(primaryColor),
        hintText: 'Title',
        hintStyle: const TextStyle(color: primaryColor)
      ),
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
