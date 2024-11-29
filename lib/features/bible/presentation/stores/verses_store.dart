import 'package:bibliaexplica/features/bible/presentation/states/chapters_state.dart';
import 'package:flutter/material.dart';

import '../states/verses_state.dart';

class VersesStore extends ValueNotifier<VersesState> {
  final VersesRepository versesRepository;

  VersesStore(this.versesRepository) : super(InitialVersesState());

  Future<void> getChapters(int bookId) async {
    value = LoadingVersesState();
    try {
      final response = await chaptersRepository.getChapters(bookId);
      if (response.isEmpty) {
        value = ErrorVersesState("Nenhum livro encontrado");
        return;
      }
      value = SuccessVersesState(response);
    } catch (e) {
      value = ErrorVersesState(e.toString());
    }
  }
}
