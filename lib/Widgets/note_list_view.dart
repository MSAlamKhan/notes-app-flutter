// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:notes_app/Models/DataModels/note_data.dart';
import 'package:provider/provider.dart';

import 'note_tile.dart';

class NoteListView extends StatelessWidget {
  const NoteListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NoteData>(
      builder: (context, notesData, child) {
        return ListView.builder(
          itemCount: notesData.noteCount,
          itemBuilder: (context, index) => Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: NoteTile(note: notesData.notes[index]),
          ),
        );
      },
    );
  }
}
