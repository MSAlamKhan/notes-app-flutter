// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:notes_app/Models/DataModels/note_data.dart';
import 'package:notes_app/Models/note.dart';

import 'package:provider/provider.dart';

class AddNoteScreen extends StatelessWidget {
  Note? note;
  AddNoteScreen({this.note});

  @override
  Widget build(BuildContext context) {
    String noteTitle = note != null ? note!.title : '',
        noteContent = note != null ? note!.content : '';
    final _titleController = TextEditingController(text: noteTitle);
    final _contentController = TextEditingController(text: noteContent);
    return Container(
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 102, 119, 111),
          border: Border(
            top: BorderSide(color: Color.fromARGB(255, 102, 119, 111)),
          )),
      child: Container(
        padding: const EdgeInsets.all(30),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              note != null ? 'Edit Note' : 'Add Note',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            // Title text field
            TextField(
              autofocus: true,
              controller: _titleController,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(hintText: 'Title'),
              onChanged: (title) => noteTitle = title,
            ),
            // Description text field
            TextField(
              controller: _contentController,
              keyboardType: TextInputType.multiline,
              minLines: 1,
              maxLines: 5,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(hintText: 'Description'),
              onChanged: (content) => noteContent = content,
            ),
            const SizedBox(
              height: 20,
            ),
            Consumer<NoteData>(
              builder: (context, noteData, child) {
                return TextButton(
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(
                        Theme.of(context).colorScheme.tertiary),
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).colorScheme.primary),
                    foregroundColor: MaterialStateProperty.all(
                        Theme.of(context).colorScheme.secondary),
                  ),
                  onPressed: () {
                    note != null
                        ? {
                            noteData.editNote(
                                newtitle: noteTitle,
                                newcontent: noteContent,
                                note: note as Note)
                          }
                        : {
                            noteData.addNote(
                                title: noteTitle, content: noteContent)
                          };
                    Navigator.pop(context);
                  },
                  child: const Text('Add'),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
