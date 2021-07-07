import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meu_cronograma/app/app_module.dart';
import 'package:meu_cronograma/app/modules/curso/curso_form.dart';
import 'package:meu_cronograma/app/modules/curso/curso_module.dart';
import 'package:meu_cronograma/app/modules/curso/curso_page.dart';

void main() {
  initModules([AppModule(), CursoModule()]);

  testWidgets('CursoPage has form', (tester) async {
    await tester.pumpWidget(buildTestableWidget(CursoPage()));
    final formFinder = find.byType(CursoForm);
    expect(formFinder, findsOneWidget);
  });
}
