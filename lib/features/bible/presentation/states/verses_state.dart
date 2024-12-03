import 'package:bibliaexplica/features/bible/data/models/verse.dart';

sealed class VersesState {}

class InitialVersesState extends VersesState {}

class SuccessVersesState extends VersesState {
  final List<Verse> verses;
  SuccessVersesState(this.verses);
}

class LoadingVersesState extends VersesState {}

class ErrorVersesState extends VersesState {
  final String message;

  ErrorVersesState(this.message);
}
