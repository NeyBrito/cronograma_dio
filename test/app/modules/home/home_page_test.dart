import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_test_utils/image_test_utils.dart';
import 'package:meu_cronograma/app/app_module.dart';
import 'package:meu_cronograma/app/modules/home/home_module.dart';
import 'package:meu_cronograma/app/modules/home/home_page.dart';
import 'package:meu_cronograma/app/modules/home/listagem_curso.dart';
import 'package:meu_cronograma/app/repositories/interfaces/curso_repository_interface.dart';
import 'package:meu_cronograma/app/shared/widgets/logo_widget.dart';
import 'package:mockito/mockito.dart';

class CursoMock extends Mock implements ICursoRepository {}

void main() {
  initModules([AppModule(), HomeModule()],
      changeBinds: [Bind<ICursoRepository>((i) => new CursoMock())]);

  setUp(() {
    var cursoRepository = AppModule.to.get<ICursoRepository>();
    when(cursoRepository.findAllCursos(any)).thenAnswer((value) async => []);
  });

  testWidgets('HomePage has logo', (tester) async {
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(buildTestableWidget(HomePage()));
      final logoFinder = find.byType(LogoWidget);
      expect(logoFinder, findsOneWidget);
    });
  });

  testWidgets('HomePage has list', (tester) async {
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(buildTestableWidget(HomePage()));
      final listagemCursoFinder = find.byType(ListagemCurso);
      expect(listagemCursoFinder, findsOneWidget);
    });
  });
}
