// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:notes_app/Screens/add_note_screen.dart';
import 'package:notes_app/Widgets/note_list_view.dart';

class NotesScreen extends StatelessWidget {
  NotesScreen({super.key});
  static const title = 'Notes App';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 18),
            child: IconButton(
              splashRadius: 15,
              icon: Icon(
                Icons.add,
                color: Theme.of(context).colorScheme.secondary,
              ),
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child:  AddNoteScreen(),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(18),
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: const Expanded(child: NoteListView()),
      ),
    );
  }
}
