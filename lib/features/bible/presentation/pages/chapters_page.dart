import 'package:flutter/material.dart';
import 'package:bibliaexplica/core/database/bible_database.dart';

class ChaptersPage extends StatefulWidget {
  final int bookId;

  const ChaptersPage({
    super.key,
    required this.bookId,
  });

  @override
  State<ChaptersPage> createState() => _ChaptersPageState();
}

class _ChaptersPageState extends State<ChaptersPage> {
  late Future<List<int>> _chapters;
  late Future<String> _bookName;

  @override
  void initState() {
    super.initState();
    _chapters = BibleDatabase.instance.getChapters(widget.bookId);
    _bookName = BibleDatabase.instance.getBookName(widget.bookId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder<String>(
          future: _bookName,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text('Carregando...');
            } else if (snapshot.hasError) {
              return const Text('Erro ao carregar livro');
            }
            return Text(snapshot.data ?? 'Livro não encontrado');
          },
        ),
        notificationPredicate: (_) => false,
      ),
      body: FutureBuilder<List<int>>(
        future: _chapters,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nenhum capítulo encontrado.'));
          }

          final chapters = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Define 3 colunas
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 1.0, // Mantém os cards quadrados
              ),
              itemCount: chapters.length,
              itemBuilder: (context, index) {
                final chapter = chapters[index];
                return GestureDetector(
                  onTap: () {
                    // Navegar para a página do capítulo
                    print('Navegando para o capítulo $chapter');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Center(
                      child: Text(
                        'Capítulo $chapter',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
