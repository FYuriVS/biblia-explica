class Book {
  final int id;
  final String name;
  final int testamentReferenceId;

  Book(
      {required this.id,
      required this.name,
      required this.testamentReferenceId});

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      id: map['id'],
      name: map['name'],
      testamentReferenceId: map['testament_reference_id'],
    );
  }
}
