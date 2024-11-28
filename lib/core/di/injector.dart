import 'package:bibliaexplica/application.dart';
import 'package:bibliaexplica/core/ui/resources/theme_controller.dart';
import 'package:bibliaexplica/features/bible/data/datasources/chapters_datasource.dart';
import 'package:bibliaexplica/features/bible/data/repositories/books_repository_impl.dart';
import 'package:bibliaexplica/features/bible/data/repositories/chapters_repository_impl.dart';
import 'package:bibliaexplica/features/bible/presentation/stores/books_store.dart';
import 'package:bibliaexplica/features/bible/presentation/stores/chapters_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';

import '../database/bible_database.dart';

void injector() {
  var i = GetIt.instance;
  i.registerSingleton<ThemeNotifier>(ThemeNotifier(ThemeMode.light),
      instanceName: 'theme');
  i.registerLazySingleton<Future<Database>>(
      () => BibleDatabase.instance.database);
  i.registerFactory<ChaptersDatasource>(() => ChaptersDatasource(getIt.get<Future<Database>>()));

  i.registerFactory<BooksStore>(() => BooksStore(BooksRepositoryImpl()));
  i.registerFactory<ChaptersStore>(
    () => ChaptersStore(
      ChaptersRepositoryImpl(
       getIt.get<ChaptersDatasource>()
      ),
    ),
  );
}
