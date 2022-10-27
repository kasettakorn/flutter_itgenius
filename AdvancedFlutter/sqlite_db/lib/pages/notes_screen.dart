// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sqlite_db/db/notes_db.dart';
import 'package:sqlite_db/models/note.dart';
import 'package:sqlite_db/pages/add_edit_note_screen.dart';
import 'package:sqlite_db/widgets/note_card_widget.dart';
import 'package:sqlite_db/widgets/note_detail_page.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  late List<Note> notes;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    refreshNote();
  }

  @override
  void dispose() {
    super.dispose();
    NotesDatabase.instance.close();
  }

  Future refreshNote() async {
    setState(() => isLoading = true);
    notes = await NotesDatabase.instance.readAllNotes();
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Note'),
        centerTitle: true,
      ),
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : notes.isEmpty
                ? Text('ไม่มีรายการบันทึก')
                : buildNote(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddEditNotePage()));
          refreshNote();
        },
      ),
    );
  }

  //Create gridview widget
  Widget buildNote() => StaggeredGridView.countBuilder(
        itemCount: notes.length,
        staggeredTileBuilder: (index) => StaggeredTile.fit(2),
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        itemBuilder: (context, index) {
          final note = notes[index];
          return GestureDetector(
            onTap: () async {
              await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NoteDetailPage(
                            noteId: note.id!,
                          )));
              refreshNote();
            },
            child: NoteCardWidget(note: note, index: index),
          );
        },
      );
}
