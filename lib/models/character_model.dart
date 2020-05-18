import 'package:hiragana_katakana/models/category_model.dart';

class Character {
  String hiragana;
  String katakana;
  String english;
  Category category;

  Character(this.hiragana, this.katakana, this.english, this.category);
}
