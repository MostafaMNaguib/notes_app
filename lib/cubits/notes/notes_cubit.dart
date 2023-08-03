import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/utils/constants.dart';

part 'notes_states.dart';

class NotesCubit extends Cubit<NotesStates>{

  NotesCubit() : super(NotesInitialState());

  fetchAllNotes() {

    emit(NotesLoadingState());

    try{
      var notesBox = Hive.box<NoteModel>(noteBox);
      List<NoteModel> notes = notesBox.values.toList();

      emit(NotesSuccessState(notes));
    }
    catch (e){
      emit(NotesFailureState(

      ));
    }


  }

}