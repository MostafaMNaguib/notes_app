import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/add_note/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/view/widgets/colors_list_view.dart';
import 'package:notes_app/view/widgets/custom_button.dart';
import 'package:notes_app/view/widgets/custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({Key? key}) : super(key: key);

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {

  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  String? title,subTitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Column(
        children: [
          const SizedBox(height: 30,),
          CustomTextField(
            hintText: 'Title',
            onSaved: (value){
              title = value;
            },
          ),
          const SizedBox(height: 30,),
          CustomTextField(
              hintText: 'Content',
              maxLines: 5,
              onSaved: (value){
                subTitle = value;
              }
          ),
          const SizedBox(height: 20,),
          const ColorsListView(),
          const SizedBox(height: 20,),
          BlocBuilder<AddNoteCubit,AddNoteState>(
            builder: (context,state) => CustomButton(
              isLoading: state is AddNoteLoadingState ? true : false ,
              onTap: (){
                if(formKey.currentState!.validate()){
                  formKey.currentState!.save();
                  var currentDate = DateTime.now();
                  var formattedCurrentDate =
                  DateFormat('dd-mm-yyyy').format(currentDate);

                  var noteModel = NoteModel(
                      title: title!, subTitle: subTitle!,
                      date: formattedCurrentDate, color: Colors.blueGrey.value
                  );

                  BlocProvider.of<AddNoteCubit>(context).addNote(
                    noteModel
                  );

                }else{
                  autoValidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
            ),
          ),
          const SizedBox(height: 20,),
        ],
      ),
    );
  }
}

