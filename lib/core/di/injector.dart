import 'package:bibliaexplica/core/ui/resources/theme_controller.dart';
import 'package:bibliaexplica/features/bible/data/repositories/books_repository_impl.dart';
import 'package:bibliaexplica/features/bible/presentation/stores/books_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void injector() {
  var i = GetIt.instance;
  i.registerSingleton<ThemeNotifier>(ThemeNotifier(ThemeMode.light),
      instanceName: 'theme');

  i.registerFactory<BooksStore>(() => BooksStore(BooksRepositoryImpl()));
}
