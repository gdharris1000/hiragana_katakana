import 'package:flutter/material.dart';
import 'package:xml/xml.dart' as xml;
import 'package:hiragana_katakana/models/character_model.dart';

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
          element.findElements("Category").first.text));
    });
    print(characters[0].hiragana);
    return characters;
  }

// Future<List<Character>> getDataFromXML(context) async {
//   String xmlString = await DefaultAssetBundle.of(context).loadString("assets/data/data.xml");
//   var data = xml.parse(xmlString);
//   var elements = data.findAllElements("character");

//   return elements.map((element){
//     return Character(element.findElements("Hiragana").first.text,
//     element.findElements("Katakana").first.text,
//     element.findElements("English").first.text,
//     element.findElements("Category").first.text);

//   }).toList();

// }

//  Future getData(context) async {
//    String xmlString =
//        await DefaultAssetBundle.of(context).loadString("assets/data/data.xml");
//    var data = xml.parse(xmlString);
//    var elements = data.findAllElements("character");
//    List<Character> questions = elements.map((element) {
//      return Character(
//          element.findElements("Hiragana").first.text,
//          element.findElements("Katakana").first.text,
//          element.findElements("English").first.text,
//          element.findElements("Category").first.text);
//    });
//    return questions;
//  }
}
