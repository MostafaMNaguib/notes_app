import 'package:flutter/material.dart';
import 'package:notes_app/utils/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, this.onTap,this.isLoading = false}) : super(key: key);

  final void Function()? onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Center(
          child: isLoading ?
          const CircularProgressIndicator(
            color: Colors.black,
          ) :
          const Text(
            'Add',
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}
