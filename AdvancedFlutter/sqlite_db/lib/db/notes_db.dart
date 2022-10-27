// ignore_for_file: prefer_const_declarations

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqlite_db/models/note.dart';

class NotesDatabase {
  NotesDatabase._init();

  static final instance = NotesDatabase._init();
  static Database? _database;

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final boolType = 'BOOLEAN NOT NULL';
    final integerType = 'INTEGER NOT NULL';

    await db.execute('''CREATE TABLE $tableNotes ( 
        ${NoteFields.id} $idType, 
        ${NoteFields.isImportant} $boolType,
        ${NoteFields.number} $integerType,
        ${NoteFields.title} $textType,
        ${NoteFields.description} $textType,
        ${NoteFields.time} $textType
      )''');
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('notes.db');
    return _database!;
  }

  // Read All Notes
  Future<List<Note>> readAllNotes() async {
    final db = await instance.database;
    final orderBy = '${NoteFields.time} ASC';
    final result = await db.query(tableNotes, orderBy: orderBy);
    return result.map((json) => Note.fromJson(json)).toList();
  }

  // Read Note by ID
  Future<Note> readNote(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableNotes,
      columns: NoteFields.values,
      where: '${NoteFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Note.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  // Create Note
  Future<Note> create(Note note) async {
    final db = await instance.database;
    final id = await db.insert(tableNotes, note.toJson());
    return note.copy(id: id);
  }

  // Update Note
  Future<int> update(Note note) async {
    final db = await instance.database;

    return db.update(
      tableNotes,
      note.toJson(),
      where: '${NoteFields.id} = ?',
      whereArgs: [note.id],
    );
  }

  // Delete Note
  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableNotes,
      where: '${NoteFields.id} = ?',
      whereArgs: [id],
    );
  }

  // Close DB
  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
