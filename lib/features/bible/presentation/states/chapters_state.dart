sealed class ChaptersState {}

class InitialChapterState extends ChaptersState {}

class SuccessChaptersState extends ChaptersState {
  final List<int> chapters;
  SuccessChaptersState(this.chapters);
}

class LoadingChaptersState extends ChaptersState {}

class ErrorChaptersState extends ChaptersState {
  final String message;

  ErrorChaptersState(this.message);
}
