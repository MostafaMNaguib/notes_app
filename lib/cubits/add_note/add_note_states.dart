
part of 'add_note_cubit.dart';

@immutable
abstract class AddNoteState{}

class AddNoteInitialState extends AddNoteState{}

class AddNoteLoadingState extends AddNoteState{}

class AddNoteSuccessState extends AddNoteState{}

class AddNoteErrorState extends AddNoteState{
  final String errorMessage;

  AddNoteErrorState(this.errorMessage);
}