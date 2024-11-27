import 'package:bibliaexplica/features/bible/domain/repositories/books_repository.dart';
import 'package:bibliaexplica/features/bible/presentation/states/books_state.dart';
import 'package:flutter/material.dart';

class BooksStore extends ValueNotifier<BooksState> {
  final BooksRepository booksRepository;

  BooksStore(this.booksRepository) : super(InitialProductsState());

  Future<void> getBooks() async {
    value = LoadingBooksState();
    try {
      final response = await booksRepository.getBooks();
      if (response.isEmpty) {
        value = ErrorBooksState("Nenhum livro encontrado");
        return;
      }
      value = SuccessBooksState(response);
    } catch (e) {
      value = ErrorBooksState(e.toString());
    }
  }
}
