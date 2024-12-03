import 'package:sqflite/sqflite.dart';

class VersesDatasource {
  final Future<Database> db;

  VersesDatasource(this.db);

  Future<List<Map<String, dynamic>>> fetchVerses(
      int bookId, int chapter) async {
    final database = await db;

    // Consulta com parâmetros bookId e chapter.
    final List<Map<String, dynamic>> verses = await database.query(
      'verse',
      where: 'book_id = ? AND chapter = ?',
      whereArgs: [bookId, chapter],
    );
    return verses;
  }
}
