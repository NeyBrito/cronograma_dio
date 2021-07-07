import 'package:flutter_test/flutter_test.dart';
import 'package:meu_cronograma/app/repositories/curso_repository.dart';
import 'package:meu_cronograma/app/repositories/interfaces/curso_repository_interface.dart';


void main() {
  ICursoRepository repository;

  setUp(() {
    repository = CursoRepository();
  });

  group('CursoRepository Test', () {
     test("First Test", () {
       expect(repository, isInstanceOf<CursoRepository>());
     });
  });
}
