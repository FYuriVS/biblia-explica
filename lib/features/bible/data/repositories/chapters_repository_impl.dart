import 'package:bibliaexplica/features/bible/data/datasources/chapters_datasource.dart';
import 'package:bibliaexplica/features/bible/domain/repositories/chapters_repository.dart';

class ChaptersRepositoryImpl implements ChaptersRepository {
  final ChaptersDatasource chaptersDatasource;

  ChaptersRepositoryImpl(this.chaptersDatasource);

  @override
  Future<List<int>> getChapters(int bookId) async {
    final data = await chaptersDatasource.fetchDataFromDb(bookId);
    return data;
  }
}
