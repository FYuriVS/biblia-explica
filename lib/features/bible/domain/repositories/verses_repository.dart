import 'package:bibliaexplica/features/bible/data/models/verse.dart';

abstract class VersesRepository {
  Future<List<Verse>> getVerses(int bookId, int chapterId);
}
