import 'package:flutter/material.dart';
import 'package:hiragana_katakana/controllers/character_controller.dart';
import 'package:hiragana_katakana/controllers/quiz_controller.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CharacterController characterController = CharacterController();

  QuizController quizController = QuizController();

  int currentQuestion = 0;

  @override
  void initState() {
    setupQuiz();
    super.initState();
  }

  void setupQuiz() {
    setState(() {
      quizController.getCharacters(context);
      currentQuestion = quizController.currentQuestion;
    });
  }

  void answerQuestion(answer) {
    quizController.checkAnswer(quizController.questions[currentQuestion],
        quizController.options[answer]);

    if (quizController.nextQuestion()) {
      setState(() {
        currentQuestion = quizController.currentQuestion;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Center(
              child: Text(quizController.questions[currentQuestion].hiragana),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    answerQuestion(0);
                  },
                  child: Text(quizController.options[0]),
                  padding: EdgeInsets.all(5.0),
                ),
                RaisedButton(
                  onPressed: () {
                    answerQuestion(1);
                  },
                  child: Text(quizController.options[1]),
                  padding: EdgeInsets.all(5.0),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    answerQuestion(2);
                  },
                  child: Text(quizController.options[2]),
                  padding: EdgeInsets.all(5.0),
                ),
                RaisedButton(
                  onPressed: () {
                    answerQuestion(3);
                  },
                  child: Text(quizController.options[3]),
                  padding: EdgeInsets.all(5.0),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
