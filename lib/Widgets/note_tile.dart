// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:notes_app/Models/DataModels/note_data.dart';
import 'package:notes_app/Screens/add_note_screen.dart';
import 'package:notes_app/Screens/view_note_screen.dart';
import 'package:provider/provider.dart';

import '../Models/note.dart';

class NoteTile extends StatelessWidget {
  Note note;

  NoteTile({required this.note});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: Theme.of(context).colorScheme.tertiary,
      child: InkWell(
        splashColor: Theme.of(context).colorScheme.primary,
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ViewNoteScreen(note: note),
              ));
        },
        child: ListTile(
          leading: Text(note.title),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                splashColor: Theme.of(context).colorScheme.primary,
                splashRadius: 20,
                icon: Icon(
                  Icons.edit,
                  size: 18,
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
                        child: AddNoteScreen(
                          note: note,
                        ),
                      ),
                    ),
                  );
                },
              ),
              Consumer<NoteData>(
                builder: (context, noteData, child) {
                  return IconButton(
                    splashColor: Theme.of(context).colorScheme.primary,
                    splashRadius: 20,
                    icon: const Icon(
                      Icons.delete,
                      size: 18,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      noteData.deleteNote(note: note);
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
