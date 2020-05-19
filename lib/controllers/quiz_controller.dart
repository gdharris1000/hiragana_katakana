import 'package:hiragana_katakana/models/answer_model.dart';
import 'package:hiragana_katakana/models/character_model.dart';

class QuizController {
  final List<Character> questions;
  List<Answer> answers = [];
  int currentQuestion = 0;

  QuizController(this.questions);

  void checkAnswer(Character question, String answer) {
    bool correct = true;

    if (answer == question.english) {
      correct = true;
    } else {
      correct = false;
    }

    answers
        .add(Answer(character: question, correct: correct, userAnswer: answer));
  }

  bool nextQuestion() {
    if (questions.length == answers.length) {
      return false;
    } else {
      return true;
    }
  }
}
