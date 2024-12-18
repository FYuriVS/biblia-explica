import 'package:bibliaexplica/application.dart';
import 'package:bibliaexplica/features/bible/presentation/states/verses_state.dart';
import 'package:bibliaexplica/features/bible/presentation/stores/verses_store.dart';
import 'package:flutter/material.dart';

class VersesPage extends StatefulWidget {
  final int bookId;
  final int chapterId;

  const VersesPage({
    super.key,
    required this.bookId,
    required this.chapterId,
  });

  @override
  State<VersesPage> createState() => _VersesPageState();
}

class _VersesPageState extends State<VersesPage> {
  VersesStore versesStore = getIt.get();

  @override
  void initState() {
    super.initState();
    versesStore.getVerses(widget.bookId, widget.chapterId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Versículos'),
        notificationPredicate: (_) => false,
      ),
      body: ValueListenableBuilder(
        valueListenable: versesStore,
        builder: (context, value, child) {
          if (value is SuccessVersesState) {
            return ListView.builder(
              itemCount: value.verses.length,
              padding: const EdgeInsets.all(8),
              itemBuilder: (context, index) {
                final verse = value.verses[index];
                return Card(
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(8.0),
                    title: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: CircleAvatar(
                            radius: 18,
                            child: Text('${verse.number}'),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          child: Text(
                            verse.text,
                            style: const TextStyle(fontSize: 16),
                            maxLines: null,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          if (value is LoadingVersesState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return const Center(
              child: Text("Erro ao carregar..."),
            );
          }
        },
      ),
    );
  }
}
