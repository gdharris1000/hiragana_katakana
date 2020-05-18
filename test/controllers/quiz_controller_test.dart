import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:hiragana_katakana/models/character_model.dart';
import 'package:hiragana_katakana/controllers/quiz_controller.dart';
import 'package:hiragana_katakana/models/category_model.dart';

class FakeCharacter extends Fake implements Character {
  Category category = Category.catA;
}

void main() {
  var character = FakeCharacter();

  List<Character> characters = [character];
  List<Category> categories = [Category.catA];

  QuizController quizController =
      QuizController(characters: characters, categories: categories);

  test('generate questions', () {
    expect(quizController.generateQuestions(), equals([character]));
  });
}
