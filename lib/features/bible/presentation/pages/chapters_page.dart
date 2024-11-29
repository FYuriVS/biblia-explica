import 'package:bibliaexplica/application.dart';
import 'package:bibliaexplica/features/bible/presentation/states/chapters_state.dart';
import 'package:bibliaexplica/features/bible/presentation/stores/chapters_store.dart';
import 'package:flutter/material.dart';

class ChaptersPage extends StatefulWidget {
  final int bookId;
  final String bookName;

  const ChaptersPage({
    super.key,
    required this.bookId,
    required this.bookName,
  });

  @override
  State<ChaptersPage> createState() => _ChaptersPageState();
}

class _ChaptersPageState extends State<ChaptersPage> {
  ChaptersStore chapterStore = getIt.get();

  @override
  void initState() {
    super.initState();
    chapterStore.getChapters(widget.bookId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.bookName),
        notificationPredicate: (_) => false,
      ),
      body: ValueListenableBuilder(
        valueListenable: chapterStore,
        builder: (context, value, child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: value is SuccessChaptersState
                ? GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                      childAspectRatio: 1.0,
                    ),
                    itemCount: value.chapters.length,
                    itemBuilder: (context, index) {
                      final chapter = value.chapters[index];
                      return GestureDetector(
                        onTap: () {
                          // Navegar para a página do capítulo
                        },
                        child: Container(
                          decoration: BoxDecoration(

                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(22.0),
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
                  )
                : value is LoadingChaptersState ? const Center(
                  child: CircularProgressIndicator(),
                ) : const Center(
              child: Text("data"),
            ),
          );
        },
      ),
    );
  }
}
