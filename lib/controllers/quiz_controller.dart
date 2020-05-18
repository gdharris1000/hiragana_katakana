import 'package:hiragana_katakana/models/category_model.dart';
import 'package:hiragana_katakana/models/character_model.dart';

class QuizController {
  final List<Category> categories;
  final List<Character> characters;

  QuizController({this.characters, this.categories});

  List<Character> generateQuestions() {
    List<Character> questions = [];

    for (int i = 0; i < characters.length; i++) {
      if (categories.contains(characters[i].category)) {
        questions.add(characters[i]);
      }
    }
    questions.shuffle();

    return questions;
  }
}
