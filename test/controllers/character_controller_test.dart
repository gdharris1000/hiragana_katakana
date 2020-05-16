import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:matcher/matcher.dart';
import 'package:hiragana_katakana/controllers/character_controller.dart';
import 'package:hiragana_katakana/models/character_model.dart';

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
}
