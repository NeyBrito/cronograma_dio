import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meu_cronograma/app/modules/curso/curso_controller.dart';
import 'package:meu_cronograma/app/modules/curso/curso_module.dart';

void main() {
  initModule(CursoModule());
  CursoController curso;

  setUp(() {
        curso = CursoModule.to.get<CursoController>();
  });

  group('CursoController Test', () {
      test("First Test", () {
        expect(curso, isInstanceOf<CursoController>());
      });

      test("Set Value", () {
        expect(curso.value, equals(0));
        curso.increment();
        expect(curso.value, equals(1));
      });
  });
}
