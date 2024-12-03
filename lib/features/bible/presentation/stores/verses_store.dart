import 'package:bibliaexplica/features/bible/domain/repositories/verses_repository.dart';
import 'package:flutter/material.dart';

import '../states/verses_state.dart';

class VersesStore extends ValueNotifier<VersesState> {
  final VersesRepository versesRepository;

  VersesStore(this.versesRepository) : super(InitialVersesState());

  Future<void> getVerses(int bookId, int chapterId) async {
    value = LoadingVersesState();
    try {
      final response = await versesRepository.getVerses(bookId, chapterId);
      if (response.isEmpty) {
        value = ErrorVersesState("Nenhum versículo encontrado");
        return;
      }
      value = SuccessVersesState(response);
    } catch (e) {
      value = ErrorVersesState(e.toString());
    }
  }
}
