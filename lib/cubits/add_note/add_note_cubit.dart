import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/utils/constants.dart';


part 'add_note_states.dart';
class AddNoteCubit extends Cubit<AddNoteState>{
  AddNoteCubit() : super(AddNoteInitialState());

  addNote(NoteModel model) async {
    emit(AddNoteLoadingState());
    
    try{
      var notesBox = Hive.box(noteBox);
      await notesBox.add(model);

      emit(AddNoteSuccessState());
    }
    catch (e){
      debugPrint('Error ${e.toString()}');
      emit(AddNoteErrorState(e.toString()));
    }


  }


}