import 'dart:convert';

class PracticeModal {
  String name;
  String nameTranslation;
  int versesCount;
  String chapterSummary;
  String chapterSummaryHindi;
  List  sholk;
  String  text;
  PracticeModal({
    required this.name,
    required this.nameTranslation,
    required this.versesCount,
    required this.chapterSummary,
    required this.chapterSummaryHindi,
    required this.sholk,
    required this.text,
  });



  factory PracticeModal.fromJson({required Map json}) => PracticeModal(
    name: json["name"],
    nameTranslation: json["name_translation"],
    versesCount: json["verses_count"],
    chapterSummary: json["chapter_summary"],
    chapterSummaryHindi: json["chapter_summary_hindi"],
    sholk: json["sholk"],
    text: json["sholk"][i]['text'],
  );

}
int i =0;