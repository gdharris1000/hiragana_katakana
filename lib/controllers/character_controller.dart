import 'package:flutter/material.dart';
import 'package:xml/xml.dart' as xml;
import 'package:hiragana_katakana/models/character_model.dart';
import 'package:hiragana_katakana/models/category_model.dart';

class CharacterController {
  Future<List<Character>> getData(context) async {
    final String xmlString =
        await DefaultAssetBundle.of(context).loadString("assets/data/data.xml");
    var data = xml.parse(xmlString);
    return populateList(data);
  }

  List<Character> populateList(data) {
    List<Character> characters = [];
    var elements = data.findAllElements("character");
    elements.forEach((element) {
      characters.add(Character(
          element.findElements("Hiragana").first.text,
          element.findElements("Katakana").first.text,
          element.findElements("English").first.text,
          categoryMatcher(element.findElements("Category").first.text)));
    });
    print(characters[0].hiragana);
    return characters;
  }

  Category categoryMatcher(categoryString) {
    if (categoryString == "a") {
      return Category.catA;
    } else if (categoryString == "k") {
      return Category.catK;
    } else if (categoryString == "g") {
      return Category.catG;
    } else if (categoryString == "ky") {
      return Category.catKy;
    } else if (categoryString == "gy") {
      return Category.catGy;
    } else if (categoryString == "s") {
      return Category.catS;
    } else if (categoryString == "z") {
      return Category.catZ;
    } else if (categoryString == "j") {
      return Category.catJ;
    } else if (categoryString == "sh") {
      return Category.catSh;
    } else if (categoryString == "d") {
      return Category.catD;
    } else if (categoryString == "t") {
      return Category.catT;
    } else if (categoryString == "ch") {
      return Category.catCh;
    } else if (categoryString == "dz") {
      return Category.catDz;
    } else if (categoryString == "n") {
      return Category.catN;
    } else if (categoryString == "Ny") {
      return Category.catNy;
    } else if (categoryString == "b") {
      return Category.catB;
    } else if (categoryString == "p") {
      return Category.catP;
    } else if (categoryString == "h") {
      return Category.catH;
    } else if (categoryString == "by") {
      return Category.catBy;
    } else if (categoryString == "py") {
      return Category.catPy;
    } else if (categoryString == "hy") {
      return Category.catHy;
    } else if (categoryString == "m") {
      return Category.catM;
    } else if (categoryString == "my") {
      return Category.catMy;
    } else if (categoryString == "y") {
      return Category.catY;
    } else if (categoryString == "r") {
      return Category.catR;
    } else if (categoryString == "ry") {
      return Category.catRy;
    } else if (categoryString == "w") {
      return Category.catW;
    }
  }
}
