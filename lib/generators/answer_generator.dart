import 'package:hiragana_katakana/models/character_model.dart';
import 'package:hiragana_katakana/models/question_model.dart';
import 'dart:math';

class AnswerGenerator {
  final Character character;
  final List<Character> characters;

  AnswerGenerator(this.character, this.characters);

  List<String> generateAnswers() {
    List<String> answers = [character.english];
    while (answers.length <= 3) {
      Random rnd = Random();
      int i = rnd.nextInt(characters.length);
      answers.add(characters[i].english);
    }
    return answers;
  }

  bool checkDuplicate(String character, List<String> answers) {
    if (answers.contains(character)) {
      return false;
    } else {
      return true;
    }
  }
}
