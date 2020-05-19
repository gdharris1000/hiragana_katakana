import 'package:hiragana_katakana/controllers/question_generator.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:hiragana_katakana/models/character_model.dart';
import 'package:hiragana_katakana/models/category_model.dart';

class FakeCharacter extends Fake implements Character {
  Category category = Category.catA;
}

void main() {
  var character = FakeCharacter();

  List<Character> characters = [character];
  List<Category> categories = [Category.catA];

  QuestionGenerator questionGenerator =
      QuestionGenerator(characters: characters, categories: categories);

  test('generate questions', () {
    expect(questionGenerator.generateQuestions(), equals([character]));
  });
}
