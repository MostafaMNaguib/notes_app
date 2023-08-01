import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/cubits/add_note/add_note_cubit.dart';
import 'package:notes_app/view/widgets/add_note_form.dart';

class NoteBottomSheet extends StatelessWidget {
  const NoteBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
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
              return ModalProgressHUD(
                inAsyncCall: state is AddNoteLoadingState,
                child: const AddNoteForm(),

              );
            }
        ),
      ),
    );
  }
}

