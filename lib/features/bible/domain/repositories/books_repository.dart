import 'package:bibliaexplica/features/bible/data/models/book.dart';

abstract class BooksRepository {
  Future<List<Book>> getBooks();
}
