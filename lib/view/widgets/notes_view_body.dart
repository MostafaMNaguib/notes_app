import 'package:flutter/material.dart';
import 'package:notes_app/view/widgets/custom_app_bar.dart';
import 'package:notes_app/view/widgets/note_item.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: const [
          SizedBox(height: 50),
          CustomAppBar(title: 'Notes',icon: Icons.search,),
          Expanded(
              child: NotesList()
          )
        ],
      ),
    );
  }

}

class NotesList extends StatelessWidget {
  const NotesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemBuilder:(context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: NoteItem(),
          );
        });
  }
}

