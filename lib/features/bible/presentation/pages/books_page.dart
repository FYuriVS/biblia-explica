import 'package:bibliaexplica/application.dart';
import 'package:bibliaexplica/features/bible/presentation/pages/chapters_page.dart';
import 'package:bibliaexplica/features/bible/presentation/states/books_state.dart';
import 'package:bibliaexplica/features/bible/presentation/stores/books_store.dart';
import 'package:flutter/material.dart';

class BooksPage extends StatefulWidget {
  const BooksPage({
    super.key,
  });

  @override
  State<BooksPage> createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  final BooksStore booksStore = getIt.get<BooksStore>();
  @override
  void initState() {
    super.initState();
    booksStore.getBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Selecione o livro'),
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          notificationPredicate: (_) => false,
        ),
        body: Material(
          child: Center(
            child: ValueListenableBuilder(
              valueListenable: booksStore,
              builder: (context, value, child) {
                if (value is SuccessBooksState) {
                  return ListView.builder(
                    itemCount: value.books.length,
                    itemBuilder: (context, index) {
                      final book = value.books[index];
                      return ListTile(
                        title: Text(book.name),
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChaptersPage(bookId: book.id),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: Text('Error'),
                  );
                }
              },
            ),
          ),
        ));
  }
}
