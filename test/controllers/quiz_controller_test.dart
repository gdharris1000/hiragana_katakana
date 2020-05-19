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
  final QuizController quizController = QuizController();

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
    group('quiz not finished', () {
      final QuizController quizController2 = QuizController();
      test(
          'return true when the number of questions greater the number of answers',
          () {
        expect(quizController2.nextQuestion(), equals(true));
      });
      test(
          'currentQuestion increases when the number of questions is greater than the number of answers',
          () {
        expect(quizController2.currentQuestion, equals(1));
      });
    });
    group('quiz finished', () {
      quizController.questions.add(character);
      test(
          'return false when the number of questions equals the number of answers',
          () {
        expect(quizController.nextQuestion(), equals(false));
      });
      test(
          'currentQuestion does not change when the number of questions is the same as the number of answers',
          () {
        quizController.nextQuestion();
        expect(quizController.currentQuestion, equals(0));
      });
    });
  });
}
