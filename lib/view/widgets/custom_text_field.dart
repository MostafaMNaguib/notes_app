import 'package:flutter/material.dart';
import 'package:notes_app/utils/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key,required this.hintText,this.maxLines = 1,
    this.onSaved}) : super(key: key);

  final String hintText;
  final int maxLines;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      cursorColor: primaryColor,
      validator: (value){
        if(value?.isEmpty ?? true){
          return 'Field is required';
        }else{
          return null;
        }
      },
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
