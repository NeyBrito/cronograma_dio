import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meu_cronograma/app/app_module.dart';
import 'package:meu_cronograma/app/domain/curso_model.dart';
import 'package:meu_cronograma/app/modules/atividade/atividade_module.dart';
import 'package:meu_cronograma/app/modules/atividade/atividade_page.dart';
import 'package:meu_cronograma/app/shared/widgets/logo_widget.dart';

void main() {
  initModules([AppModule(), AtividadeModule()]);
  testWidgets('AtividadePage has logo', (tester) async {
     await tester.pumpWidget(buildTestableWidget(AtividadePage(curso: CursoModel(),)));
     final logoFinder = find.byType(LogoWidget);
     expect(logoFinder, findsOneWidget);
  });
}
