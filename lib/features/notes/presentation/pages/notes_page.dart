import 'dart:math';
import 'package:bibliaexplica/features/notes/presentation/pages/note_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class NotesPage extends StatelessWidget {
  final List<String> notas = [
    'Nota 1: Comprar pão',
    'Nota 2: Estudar Flutter',
    'Nota 3: Reunião às 10h',
    'Nota 4: Exercício físico',
    'Nota 5: Ler um livro',
    'Nota 6: Fazer backup',
    'Nota 7: Meditar',
    'Nota 8: Planejar viagem',
  ];

  NotesPage({super.key});

  Color getThemeColor(BuildContext context) {
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
        title: Text(
          'Minhas Anotações',
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        centerTitle: true,
        notificationPredicate: (_) => false,
      ),
      body: MasonryGridView.builder(
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        padding: const EdgeInsets.all(4),
        itemCount: notas.length,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        itemBuilder: (context, index) {
          double randomHeight = (Random().nextInt(100) + 150).toDouble();
          return Container(
            height: randomHeight,
            decoration: BoxDecoration(
              color: getThemeColor(context),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  notas[index],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const NotePage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
