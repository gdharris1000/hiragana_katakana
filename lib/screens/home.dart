import 'package:flutter/material.dart';
import 'package:hiragana_katakana/controllers/character_controller.dart';
import 'package:hiragana_katakana/models/category_model.dart';
import 'package:hiragana_katakana/models/character_model.dart';
import 'package:hiragana_katakana/controllers/quiz_controller.dart';

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

  @override
  void initState() {
    getCharacters();
    super.initState();
  }

  void getCharacters() async {
    List<Character> characters = [];
    characters = await characterController.getData(context);
    getQuestions(characters);
  }

  void getQuestions(characters) {
    QuizController quizController =
        QuizController(characters: characters, categories: [Category.catA]);
    setState(() {
      questions = quizController.generateQuestions();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Center(
              child: Text(questions[0].hiragana),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {},
                  child: Text('Answer 1'),
                  padding: EdgeInsets.all(5.0),
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text('Answer 2'),
                  padding: EdgeInsets.all(5.0),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {},
                  child: Text('Answer 3'),
                  padding: EdgeInsets.all(5.0),
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text('Answer 4'),
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
