import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:hiragana_katakana/models/character_model.dart';
import 'package:hiragana_katakana/generators/answer_generator.dart';

class FakeCharacter extends Fake implements Character {
  final String hiragana;
  final String english;
  FakeCharacter(this.hiragana, this.english);
}

void main() {
  final characterA = FakeCharacter('あ', 'a');
  final characterI = FakeCharacter('い', 'i');
  final characterU = FakeCharacter('う', 'u');
  final characterE = FakeCharacter('え', 'e');
  final characterO = FakeCharacter('お', 'o');
  final characters = [
    characterA,
    characterE,
    characterI,
    characterO,
    characterU
  ];

  final AnswerGenerator answerGenerator =
      AnswerGenerator(characterA, characters);

  test('smoke test', () {
    expect(answerGenerator.character, equals(characterA));
  });

  group('generateAnswers method', () {
    answerGenerator.generateAnswers();

    test('correct answer added to answer list', () {
      expect(answerGenerator.generateAnswers(), contains('a'));
    });

    test('answer list length is 4', () {
      expect(answerGenerator.generateAnswers().length, equals(4));
    });
  });

  group('check for duplicates', () {
    final List<String> answers = ['a'];
    final String character1 = 'a';
    final String character2 = 'i';

    test('returns false when there is a duplicate', () {
      expect(
          answerGenerator.checkDuplicate(character1, answers), equals(false));
    });

    test('returns true when there is no duplicate', () {
      expect(answerGenerator.checkDuplicate(character2, answers), equals(true));
    });
  });
}
