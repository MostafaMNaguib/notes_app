import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/utils/constants.dart';
import 'package:notes_app/view/widgets/color_item.dart';

class EditNoteColorsListView extends StatefulWidget {
  const EditNoteColorsListView({Key? key, required this.note}) : super(key: key);

  final NoteModel note;

  @override
  State<EditNoteColorsListView> createState() => _EditNoteColorsListViewState();
}

class _EditNoteColorsListViewState extends State<EditNoteColorsListView> {

  late int currentIndex ;

  @override
  void initState() {
    currentIndex = constColors.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30 * 2,
      child: ListView.builder(
        itemCount: constColors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GestureDetector(
              onTap: (){
                currentIndex = index;
                // BlocProvider.of<AddNoteCubit>(context).color = colors[index];
                widget.note.color = constColors[index].value;
                setState(() {});
              },
              child: ColorItem(
                isActive: currentIndex == index,
                color: constColors[index],
              ),
            ),
          );
        },

      ),
    );
  }
}
