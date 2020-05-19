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
  final QuizController quizController = QuizController([character, character]);

  group('checkAnswer', () {
    test('false when answer is incorrect', () {
      quizController.checkAnswer(character, 'i');
      expect(quizController.answers[0].correct, equals(false));
    });

    test('true when answer is correct', () {
      quizController.checkAnswer(character, 'a');
      expect(quizController.answers[1].correct, equals(true));
    });
  });

  group('nextQuestion', () {
    test(
        'return true when the number of questions greater the number of answers',
        () {
      final QuizController quizController2 = QuizController([character]);
      expect(quizController2.nextQuestion(), equals(true));
    });

    test(
        'return false when the number of questions equals the number of answers',
        () {
      expect(quizController.nextQuestion(), equals(false));
    });
  });
}
