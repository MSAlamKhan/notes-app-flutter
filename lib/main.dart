import 'package:flutter/material.dart';
import 'package:notes_app/Models/DataModels/note_data.dart';
import 'package:notes_app/Screens/notes_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NoteData(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color(0xffA5F1E9),
            secondary: const Color.fromARGB(255, 104, 157, 177),
            tertiary: const Color.fromARGB(255, 252, 245, 219),
            background: const Color(0xffE1FFEE),
          ),
          textTheme: const TextTheme(
            bodyText2: TextStyle(
              color: Color(0xff7FBCD2),
            ),
            // titleLarge: const TextStyle(color: Color(0xffDFD3C3)),
          ),
        ),
        home: NotesScreen(),
      ),
    );
  }
}
