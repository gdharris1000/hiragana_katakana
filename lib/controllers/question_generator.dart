import 'package:flutter/material.dart';
import 'package:hiragana_katakana/controllers/character_controller.dart';
import 'package:hiragana_katakana/models/character_model.dart';
import 'package:hiragana_katakana/models/question_model.dart';

class QuestionGenerator {
  List<String> categories;

  QuestionGenerator(this.categories);

  final characterController = CharacterController();

//  List<Question> questions = getData(context);

  getData(context) async {
    await characterController.getData(context);
  }
}
