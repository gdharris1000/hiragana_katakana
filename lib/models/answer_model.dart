import 'package:hiragana_katakana/models/character_model.dart';

class Answer {
  Character character;
  bool correct;
  String userAnswer;

  Answer({this.character, this.correct, this.userAnswer});
}
