import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:matcher/matcher.dart';
import 'package:hiragana_katakana/controllers/character_controller.dart';
import 'package:hiragana_katakana/models/character_model.dart';
import 'package:hiragana_katakana/models/category_model.dart';

void main() {
  testWidgets('test character list setup', (WidgetTester tester) async {
    await tester.pumpWidget(
      Builder(
        builder: (BuildContext context) {
          CharacterController characterController = CharacterController();

          expect(characterController.getData(context),
              isA<Future<List<Character>>>());

          // The builder function must return a widget.
          return Placeholder();
        },
      ),
    );
  });

  group('categoryMatcher', () {
    CharacterController characterController = CharacterController();
    test('category a', () {
      expect(characterController.categoryMatcher("a"), equals(Category.catA));
    });
    test('category k', () {
      expect(characterController.categoryMatcher("k"), equals(Category.catK));
    });
    test('category g', () {
      expect(characterController.categoryMatcher("g"), equals(Category.catG));
    });
    test('category ky', () {
      expect(characterController.categoryMatcher("ky"), equals(Category.catKy));
    });
    test('category gy', () {
      expect(characterController.categoryMatcher("gy"), equals(Category.catGy));
    });
    test('category s', () {
      expect(characterController.categoryMatcher("s"), equals(Category.catS));
    });
    test('category z', () {
      expect(characterController.categoryMatcher("z"), equals(Category.catZ));
    });
    test('category j', () {
      expect(characterController.categoryMatcher("j"), equals(Category.catJ));
    });
    test('category sh', () {
      expect(characterController.categoryMatcher("sh"), equals(Category.catSh));
    });
    test('category t', () {
      expect(characterController.categoryMatcher("t"), equals(Category.catT));
    });
    test('category d', () {
      expect(characterController.categoryMatcher("d"), equals(Category.catD));
    });
    test('category ch', () {
      expect(characterController.categoryMatcher("ch"), equals(Category.catCh));
    });
    test('category dz', () {
      expect(characterController.categoryMatcher("dz"), equals(Category.catDz));
    });
    test('category n', () {
      expect(characterController.categoryMatcher("n"), equals(Category.catN));
    });
    test('category ny', () {
      expect(characterController.categoryMatcher("ny"), equals(Category.catNy));
    });
    test('category h', () {
      expect(characterController.categoryMatcher("h"), equals(Category.catH));
    });
    test('category b', () {
      expect(characterController.categoryMatcher("b"), equals(Category.catB));
    });
    test('category p', () {
      expect(characterController.categoryMatcher("p"), equals(Category.catP));
    });
    test('category hy', () {
      expect(characterController.categoryMatcher("hy"), equals(Category.catHy));
    });
    test('category by', () {
      expect(characterController.categoryMatcher("by"), equals(Category.catBy));
    });
    test('category py', () {
      expect(characterController.categoryMatcher("py"), equals(Category.catPy));
    });
    test('category m', () {
      expect(characterController.categoryMatcher("m"), equals(Category.catM));
    });
    test('category y', () {
      expect(characterController.categoryMatcher("y"), equals(Category.catY));
    });
    test('category r', () {
      expect(characterController.categoryMatcher("r"), equals(Category.catR));
    });
    test('category ry', () {
      expect(characterController.categoryMatcher("ry"), equals(Category.catRy));
    });
    test('category w', () {
      expect(characterController.categoryMatcher("w"), equals(Category.catW));
    });
    test('category my', () {
      expect(characterController.categoryMatcher("my"), equals(Category.catMy));
    });
  });
}
