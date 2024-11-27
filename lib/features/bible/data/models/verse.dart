class Verse {
  final int id;
  final int chapterId;
  final int number;
  final String text;

  Verse(
      {required this.id,
      required this.chapterId,
      required this.number,
      required this.text});

  factory Verse.fromMap(Map<String, dynamic> map) {
    return Verse(
      id: map['id'],
      chapterId: map['chapter_id'],
      number: map['number'],
      text: map['text'],
    );
  }
}
