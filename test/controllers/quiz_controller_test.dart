import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:hiragana_katakana/models/character_model.dart';
import 'package:hiragana_katakana/controllers/quiz_controller.dart';
import 'package:hiragana_katakana/models/category_model.dart';

class FakeCharacter extends Fake implements Character {
  Category category = Category.catA;
  String english = "a";
}

void main() {
  final character = FakeCharacter();
  QuizController quizController = QuizController([character]);

  group('checkAnswer', () {
    test('false when answer is incorrect', () {
      quizController.checkAnswer(character, 'i');
      expect(quizController.answers[0].correct, equals(false));
    });

    test('true when answer is correct', () {
      quizController.checkAnswer(character, 'a');
      print(quizController.answers);
      expect(quizController.answers[1].correct, equals(true));
    });
  });
}
