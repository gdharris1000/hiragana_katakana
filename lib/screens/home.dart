import 'package:flutter/material.dart';
import 'package:hiragana_katakana/controllers/character_controller.dart';
import 'package:hiragana_katakana/generators/question_generator.dart';
import 'package:hiragana_katakana/generators/answer_generator.dart';
import 'package:hiragana_katakana/models/category_model.dart';
import 'package:hiragana_katakana/models/character_model.dart';
import 'package:hiragana_katakana/controllers/quiz_controller.dart';
import 'package:hiragana_katakana/generators/question_generator.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CharacterController characterController = CharacterController();

  List<Character> questions = [
    Character("getting data", "getting data", "getting data", Category.catA)
  ];
  QuizController quizController = QuizController();

  @override
  void initState() {
    setupQuiz();
    super.initState();
  }

  void setupQuiz() {
    setState(() {
      quizController.getCharacters(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Center(
              child: Text(quizController
                  .questions[quizController.currentQuestion].hiragana),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {},
                  child: Text(quizController.options[0]),
                  padding: EdgeInsets.all(5.0),
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text(quizController.options[1]),
                  padding: EdgeInsets.all(5.0),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {},
                  child: Text(quizController.options[2]),
                  padding: EdgeInsets.all(5.0),
                ),
                RaisedButton(
                  onPressed: () {},
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
