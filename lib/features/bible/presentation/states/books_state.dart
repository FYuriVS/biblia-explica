import 'package:bibliaexplica/features/bible/data/models/book.dart';

sealed class BooksState {}

class InitialProductsState extends BooksState {}

class SuccessBooksState extends BooksState {
  final List<Book> books;
  SuccessBooksState(this.books);
}

class LoadingBooksState extends BooksState {}

class ErrorBooksState extends BooksState {
  final String message;

  ErrorBooksState(this.message);
}
