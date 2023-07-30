import 'package:flutter/material.dart';
import 'package:notes_app/view/widgets/custom_button.dart';
import 'package:notes_app/view/widgets/custom_text_field.dart';

class NoteBottomSheet extends StatelessWidget {
  const NoteBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: const [
            SizedBox(height: 30,),
            CustomTextField(
              hintText: 'Title'
            ),
            SizedBox(height: 30,),
            CustomTextField(
              hintText: 'Content',
              maxLines: 5,
            ),
            SizedBox(height: 40,),
            CustomButton(),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
