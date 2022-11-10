import 'dart:collection';
import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:notes_app/Models/note.dart';

class NoteData extends ChangeNotifier {
  final List<Note> _noteList = [
    Note(title: 'title 1', content: 'content 1'),
    Note(title: 'title 2', content: 'content 2'),
    Note(title: 'title 3', content: 'content 3'),
  ];

  UnmodifiableListView<Note> get notes {
    return UnmodifiableListView(_noteList);
  }

  int get noteCount {
    return _noteList.length;
  }

  void addNote({required String title, required String content}) {
    _noteList.add(Note(title: title, content: content));
    notifyListeners();
  }

  void editNote(
      {required String newtitle,
      required String newcontent,
      required Note note}) {
    Note newNote = Note(title: newtitle, content: newcontent);
    int index = _noteList.indexOf(note);
    _noteList[index] = newNote;
    notifyListeners();
  }

  void deleteNote({required Note note}) {
    _noteList.remove(note);
    notifyListeners();
  }
}
