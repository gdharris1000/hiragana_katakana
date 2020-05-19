import 'package:hiragana_katakana/models/answer_model.dart';
import 'package:hiragana_katakana/models/category_model.dart';
import 'package:hiragana_katakana/models/character_model.dart';

class QuizController {
  final List<Character> questions;
  List<Answer> answers;

  QuizController(this.questions);
}
