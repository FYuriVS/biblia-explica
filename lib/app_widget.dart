import 'package:bibliaexplica/application.dart';
import 'package:bibliaexplica/core/ui/resources/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:bibliaexplica/features/bible/presentation/pages/books_page.dart';
import 'package:bibliaexplica/features/home/home_page.dart';
import 'package:bibliaexplica/features/notes/presentation/pages/notes_page.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  int _currentIndex = 0;

  final ThemeNotifier themeNotifier =
      getIt.get<ThemeNotifier>(instanceName: 'theme');

  static final List<Widget> _pages = [
    const HomePage(),
    const BooksPage(),
    NotesPage(),
  ];

  void _onTabSelected(int index) {
    if (index != _currentIndex) {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: _currentIndex,
          children: _pages,
        ),
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.transparent,
        selectedIndex: _currentIndex,
        onDestinationSelected: _onTabSelected,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: "Início"),
          NavigationDestination(icon: Icon(Icons.book_sharp), label: "Bíblia"),
          NavigationDestination(icon: Icon(Icons.notes), label: "Notas"),
        ],
      ),
    );
  }
}
