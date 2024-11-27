class Chapter {
  final int id;
  final int bookId;
  final int number;

  Chapter({required this.id, required this.bookId, required this.number});

  factory Chapter.fromMap(Map<String, dynamic> map) {
    return Chapter(
      id: map['id'],
      bookId: map['book_id'],
      number: map['number'],
    );
  }
}
