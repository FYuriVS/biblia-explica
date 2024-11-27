import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;

class BibleDatabase {
  static final BibleDatabase instance = BibleDatabase._init();
  static Database? _database;

  BibleDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'bible.sqlite');

    if (!await File(path).exists()) {
      final data = await rootBundle.load('assets/ACF.sqlite');
      final bytes = data.buffer.asUint8List();
      await File(path).writeAsBytes(bytes, flush: true);
    }

    return await openDatabase(path);
  }

  Future<List<int>> getChapters(int bookId) async {
    final db = await database;
    final result = await db.rawQuery(
      'SELECT DISTINCT chapter FROM verse WHERE book_id = ?',
      [bookId],
    );
    return result.map((row) => row['chapter'] as int).toList();
  }

  Future<String> getBookName(int bookId) async {
    final db = await database;
    final result = await db.rawQuery(
      'SELECT name FROM book WHERE id = ?',
      [bookId],
    );

    if (result.isNotEmpty) {
      return result.first['name'] as String;
    } else {
      throw Exception('Livro não encontrado.');
    }
  }
}
