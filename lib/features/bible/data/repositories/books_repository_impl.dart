import 'package:bibliaexplica/core/database/bible_database.dart';
import 'package:bibliaexplica/features/bible/data/models/book.dart';
// import 'package:bibliaexplica/features/bible/data/models/verse.dart';
import 'package:bibliaexplica/features/bible/domain/repositories/books_repository.dart';

class BooksRepositoryImpl extends BooksRepository {
  final db = BibleDatabase.instance.database;

  @override
  Future<List<Book>> getBooks() async {
    final data = await (await db).query('book');
    return data.map((map) => Book.fromMap(map)).toList();
  }

  // Future<List<Chapter>> getChapters(int bookId) async {
  //   final data = await (await db)
  //       .query('chapters', where: 'book_id = ?', whereArgs: [bookId]);
  //   return data.map((map) => Chapter.fromMap(map)).toList();
  // }

  // Future<List<Verse>> getVerses(int chapterId) async {
  //   final data = await (await db)
  //       .query('verse', where: 'chapter_id = ?', whereArgs: [chapterId]);
  //   return data.map((map) => Verse.fromMap(map)).toList();
  // }
}
