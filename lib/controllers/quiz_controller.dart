import 'package:hiragana_katakana/models/character_model.dart';

class QuizController {
  final List categories;
  final List<Character> characters;

  QuizController({this.characters, this.categories});

  List<Character> generateQuestions() {
    List<Character> questions = [];

    for (var i = 0; i > characters.length; i++) {
      if (categories.contains(characters[i].category)) {
        questions.add(characters[i]);
      }
    }
  }
}
