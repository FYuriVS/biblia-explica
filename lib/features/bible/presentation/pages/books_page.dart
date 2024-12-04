import 'package:bibliaexplica/application.dart';
import 'package:bibliaexplica/features/bible/presentation/pages/chapters_page.dart';
import 'package:bibliaexplica/features/bible/presentation/states/books_state.dart';
import 'package:bibliaexplica/features/bible/presentation/stores/books_store.dart';
import 'package:flutter/material.dart';
import 'dart:math'; // Para gerar cores aleatórias

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

  Color getRandomThemeColor(BuildContext context) {
    final colorOptions = [
      Theme.of(context).colorScheme.primary,
      Theme.of(context).colorScheme.secondary,
      Theme.of(context).colorScheme.tertiary,
    ];
    return colorOptions[Random().nextInt(colorOptions.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Selecione o livro',
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
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
                    final tileColor = getRandomThemeColor(context);

                    return ListTile(
                      title: Text(
                        book.name,
                        style: TextStyle(
                            color: (Theme.of(context).colorScheme.onPrimary)),
                      ),
                      tileColor: tileColor,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChaptersPage(
                              bookId: book.id,
                              bookName: book.name,
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              }
              if (value is LoadingBooksState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return const Center(
                  child: Text('Error'),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
