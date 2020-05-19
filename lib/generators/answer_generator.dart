import 'package:hiragana_katakana/models/character_model.dart';
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
      if (checkDuplicate(characters[i].english, answers)) {
        answers.add(characters[i].english);
        print(answers);
      }
    }
    answers.shuffle();
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
