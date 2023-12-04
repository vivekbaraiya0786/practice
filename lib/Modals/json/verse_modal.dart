// import 'dart:convert';
//
// class Verse {
//   String name;
//   String nameTranslation;
//   String imageh;
//   String imagee;
//   List<Sholk>? sholk;
//   int versesCount;
//   String chapterSummary;
//   String chapterSummaryHindi;
//   int? chapterId;
//   int chapterNumber;
//   int externalId;
//   int id;
//   String title;
//   int verseNumber;
//   int verseOrder;
//   String? transliteration;
//
//   Verse({
//     required this.name,
//     required this.nameTranslation,
//     required this.imageh,
//     required this.imagee,
//     required this.sholk,
//     required this.versesCount,
//     required this.chapterSummary,
//     required this.chapterSummaryHindi,
//     required this.chapterId,
//     required this.chapterNumber,
//     required this.externalId,
//     required this.id,
//     required this.title,
//     required this.verseNumber,
//     required this.verseOrder,
//     required this.transliteration,
//   });
//
//
//
//
//   factory Verse.fromJson({required Map<String, dynamic> json}) => Verse(
//     name: json["name"],
//     nameTranslation: json["name_translation"],
//     imageh: json["imageh"],
//     imagee: json["imagee"],
//     sholk: List<Sholk>.from(json["sholk"].map((x) => Sholk.fromJson(x))),
//     versesCount: json["verses_count"],
//     chapterSummary: json["chapter_summary"],
//     chapterSummaryHindi: json["chapter_summary_hindi"],
//     chapterId: json["chapter_id"],
//     chapterNumber: json["chapter_number"],
//     externalId: json["externalId"],
//     id: json["id"],
//     title: json["title"],
//     verseNumber: json["verse_number"],
//     verseOrder: json["verse_order"],
//     transliteration: json["transliteration"],
//   );
//
// }
//
//
// class Sholk {
//   String? id;
//   String? text;
//   String? wordMeanings;
//   String? descriptionh;
//   String? descriptione;
//   String? transliteration;
//   String? description;
//
//   Sholk({
//      this.id,
//     required this.text,
//     required this.wordMeanings,
//     required this.descriptionh,
//     required this.descriptione,
//     required this.transliteration,
//      this.description,
//   });
//
//   factory Sholk.fromJson(Map<String, dynamic> json) => Sholk(
//     id: json["id"],
//     text: json["text"],
//     wordMeanings: json["word_meanings"],
//     descriptionh: json["descriptionh"],
//     descriptione: json["descriptione"],
//     transliteration: json["transliteration"],
//     description: json["description"],
//   );
//
//   // Map<String, dynamic> toJson() => {
//   //   "id": id,
//   //   "text": text,
//   //   "word_meanings": wordMeanings,
//   //   "descriptionh": descriptionh,
//   //   "descriptione": descriptione,
//   //   "transliteration": transliteration,
//   //   "description": description,
//   // };
// }
//
//

class Verse {
  String name;
  String nameTranslation;
  String imageh;
  String imagee;
  List<Sholk>? sholk;
  int versesCount;
  String chapterSummary;
  String chapterSummaryHindi;
  int? chapterId;
  int chapterNumber;
  int externalId;
  int id;
  String title;
  int verseNumber;
  int verseOrder;
  String? transliteration;

  Verse({
    required this.name,
    required this.nameTranslation,
    required this.imageh,
    required this.imagee,
    required this.sholk,
    required this.versesCount,
    required this.chapterSummary,
    required this.chapterSummaryHindi,
    required this.chapterId,
    required this.chapterNumber,
    required this.externalId,
    required this.id,
    required this.title,
    required this.verseNumber,
    required this.verseOrder,
    this.transliteration,
  });

  factory Verse.fromJson({required Map json}) => Verse(
        name: json["name"],
        nameTranslation: json["name_translation"],
        imageh: json["imageh"],
        imagee: json["imagee"],
        sholk:
            List<Sholk>.from(json["sholk"].map((x) => Sholk.fromJson(json: x))),
        versesCount: json["verses_count"],
        chapterSummary: json["chapter_summary"],
        chapterSummaryHindi: json["chapter_summary_hindi"],
        chapterId: json["chapter_id"],
        chapterNumber: json["chapter_number"],
        externalId: json["externalId"],
        id: json["id"],
        title: json["title"],
        verseNumber: json["verse_number"],
        verseOrder: json["verse_order"],
        transliteration: json["transliteration"],
      );
}

class Sholk {
  String id;
  String text;
  String? wordMeanings;
  String descriptionh;
  String? descriptione;
  String transliteration;
  String? description;

  Sholk({
    required this.id,
    required this.text,
    this.wordMeanings,
    required this.descriptionh,
    this.descriptione,
    required this.transliteration,
    this.description,
  });

  factory Sholk.fromJson({required Map<String, dynamic> json}) => Sholk(
        id: json["id"],
        text: json["text"],
        wordMeanings: json["word_meanings"],
        descriptionh: json["descriptionh"],
        descriptione: json["descriptione"],
        transliteration: json["transliteration"],
        description: json["description"],
      );
}

class StudentModal {
  int id;
  String name;
  String course;
  int age;

  StudentModal({
    required this.id,
    required this.name,
    required this.course,
    required this.age,
  });

  factory StudentModal.fromMap({required Map data}) {
    return StudentModal(
      id: data['id'],
      name: data['name'],
      course: data['course'],
      age: data['age'],
    );
  }
}
