part of 'notes_cubit.dart';

@immutable
abstract class NotesStates{}

class NotesInitialState extends NotesStates{}

// class NotesLoadingState extends NotesStates{}

class NotesSuccessState extends NotesStates{
  final List<NoteModel> notes;

  NotesSuccessState(this.notes);
}

// class NotesFailureState extends NotesStates{}