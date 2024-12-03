import 'package:sqflite/sqflite.dart';

class ChaptersDatasource {
  final Future<Database> db;

  ChaptersDatasource(this.db);

  Future<List<int>> fetchDataFromDb(int bookId) async {
    final data = await (await db).rawQuery(
      'SELECT DISTINCT chapter FROM verse WHERE book_id = ?',
      [bookId],
    );

    return data.map((row) => row['chapter'] as int).toList();
  }
}
