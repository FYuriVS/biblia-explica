import 'package:bibliaexplica/features/bible/domain/repositories/chapters_repository.dart';
import 'package:bibliaexplica/features/bible/presentation/states/chapters_state.dart';
import 'package:flutter/material.dart';

class ChaptersStore extends ValueNotifier<ChaptersState> {
  final ChaptersRepository chaptersRepository;

  ChaptersStore(this.chaptersRepository) : super(InitialChapterState());

  Future<void> getChapters(int bookId) async {
    value = LoadingChaptersState();
    try {
      final response = await chaptersRepository.getChapters(bookId);
      if (response.isEmpty) {
        value = ErrorChaptersState("Nenhum livro encontrado");
        return;
      }
      value = SuccessChaptersState(response);
    } catch (e) {
      value = ErrorChaptersState(e.toString());
    }
  }
}
