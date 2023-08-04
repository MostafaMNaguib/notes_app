import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/utils/constants.dart';

part 'notes_states.dart';

class NotesCubit extends Cubit<NotesStates>{

  NotesCubit() : super(NotesInitialState());

  List<NoteModel>? notes ;

  fetchAllNotes() {

    var notesBox = Hive.box<NoteModel>(noteBox);
    notes = notesBox.values.toList();
    emit(NotesSuccessState(notes!));
  }

}