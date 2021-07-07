
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meu_cronograma/app/shared/widgets/logo_widget.dart';

void main() {
  testWidgets('LogoWidget has logo', (tester) async {
    await tester.pumpWidget(buildTestableWidget(LogoWidget()));
    final logoFinder = find.byKey(Key("logo_image_key"));
    expect(logoFinder, findsOneWidget);
  });
}
