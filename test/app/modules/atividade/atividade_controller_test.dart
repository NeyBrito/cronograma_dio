import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meu_cronograma/app/app_module.dart';
import 'package:meu_cronograma/app/domain/atividade_model.dart';
import 'package:meu_cronograma/app/domain/curso_model.dart';
import 'package:meu_cronograma/app/modules/atividade/atividade_controller.dart';
import 'package:meu_cronograma/app/modules/atividade/atividade_module.dart';
import 'package:meu_cronograma/app/repositories/interfaces/atividade_repository_interface.dart';
import 'package:meu_cronograma/app/repositories/interfaces/curso_repository_interface.dart';
import 'package:mockito/mockito.dart';

class AtividadeMock extends Mock implements IAtividadeRepository {}

class CursoMock extends Mock implements ICursoRepository {}

void main() {
  initModules([
    AppModule(),
    AtividadeModule()
  ], changeBinds: [
    Bind<IAtividadeRepository>((i) => new AtividadeMock()),
    Bind<ICursoRepository>((i) => new CursoMock())
  ]);
  AtividadeController atividade;

  setUp(() {
    atividade = AtividadeModule.to.get<AtividadeController>();
  });

  group('AtividadeController Test', () {
    test("First Test", () {
      expect(atividade, isInstanceOf<AtividadeController>());
    });

    test("Get Atividades", () async {
      var atividadeRepository = AppModule.to.get<IAtividadeRepository>();
      when(atividadeRepository.findAllAtividadesByCurso(CursoModel(id: 111)))
          .thenAnswer((value) async => []);
      var cursoRepository = AppModule.to.get<ICursoRepository>();
      when(cursoRepository.updatePercentConcluido(any, any))
          .thenAnswer((value) async => []);


      var atividades = await atividade.getAtividades(CursoModel(id: 111));
      int qtdAtividadesBefore = atividades.length;
      expect(qtdAtividadesBefore, equals(0));
      await atividade.saveAtividade(AtividadeModel());
      atividades = await atividade.getAtividades(CursoModel(id: 111));
      int qtdAtividades = atividades.length;
      expect(qtdAtividades, equals(1));
    });
  });
}
