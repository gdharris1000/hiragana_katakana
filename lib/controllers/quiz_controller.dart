import 'package:hiragana_katakana/controllers/character_controller.dart';
import 'package:hiragana_katakana/generators/question_generator.dart';
import 'package:hiragana_katakana/generators/answer_generator.dart';
import 'package:hiragana_katakana/models/answer_model.dart';
import 'package:hiragana_katakana/models/category_model.dart';
import 'package:hiragana_katakana/models/character_model.dart';

class QuizController {
  List<Character> questions = [
    Character("getting data", "getting data", "getting data", Category.catA)
  ];
  List<Answer> answers = [];
  int currentQuestion = 0;
  List<String> options = ["", "", "", ""];

//  QuizController(this.questions);

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
      currentQuestion++;
      return true;
    }
  }

  void getCharacters(context) async {
    CharacterController characterController = CharacterController();
    List<Character> characters = [];
    characters = await characterController.getData(context);
    getQuestions(characters);
  }

  void getQuestions(characters) {
    QuestionGenerator questionGenerator =
        QuestionGenerator(characters: characters, categories: [Category.catA]);

    questions = questionGenerator.generateQuestions();
    print(questions[currentQuestion].hiragana);
    options = getOptions(questions[currentQuestion], questions);
  }

  List<String> getOptions(Character character, List<Character> characters) {
    AnswerGenerator answerGenerator = AnswerGenerator(character, characters);
    return answerGenerator.generateAnswers();
  }
}
