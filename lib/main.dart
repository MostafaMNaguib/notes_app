import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/cubits/add_note/add_note_cubit.dart';
import 'package:notes_app/cubits/simple_bloc_observer.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/utils/constants.dart';
import 'package:notes_app/view/notes_view.dart';

void main()async {

  await Hive.initFlutter();
  await Hive.openBox(noteBox);
  Hive.registerAdapter(NoteModelAdapter());

  Bloc.observer = SimpleBlocObserver();

  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddNoteCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Poppins'
        ),
        home: const NotesView(),
      ),
    );
  }
}
