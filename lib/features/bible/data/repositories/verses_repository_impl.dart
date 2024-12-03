import 'package:bibliaexplica/features/bible/data/datasources/verses_datasource.dart';
import 'package:bibliaexplica/features/bible/data/models/verse.dart';
import 'package:bibliaexplica/features/bible/domain/repositories/verses_repository.dart';

class VersesRepositoryImpl implements VersesRepository {
  final VersesDatasource versesDatasource;

  VersesRepositoryImpl(this.versesDatasource);

  @override
  Future<List<Verse>> getVerses(int bookId, int chapterId) async {
    final data = await versesDatasource.fetchVerses(bookId, chapterId);
    return data.map((map) => Verse.fromMap(map)).toList();
  }
}
