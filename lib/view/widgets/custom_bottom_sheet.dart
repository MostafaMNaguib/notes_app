import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note/add_note_cubit.dart';
import 'package:notes_app/view/widgets/add_note_form.dart';

class NoteBottomSheet extends StatelessWidget {
  const NoteBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit() ,
      child: BlocConsumer<AddNoteCubit,AddNoteState>(
          listener: (listenerContext,state) {
            if(state is AddNoteErrorState){
              log('Failed');
            }
            if(state is AddNoteSuccessState){
              Navigator.pop(context);
            }

          },
          builder:(context,state) {
            return AbsorbPointer(
              absorbing: state is AddNoteLoadingState ? true : false,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 16,right: 16,
                  bottom: MediaQuery.of(context).viewInsets.bottom
                ),
                child: const SingleChildScrollView(
                    child: AddNoteForm()
                ),
              ),
            );
          }
      ),
    );
  }
}

