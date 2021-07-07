import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meu_cronograma/app/repositories/atividade_repository.dart';
import 'package:meu_cronograma/app/repositories/interfaces/atividade_repository_interface.dart';
import 'package:mockito/mockito.dart';

class MockClient extends Mock implements Dio {}

void main() {
  IAtividadeRepository repository;

  setUp(() {
    repository = AtividadeRepository();
  });

  group('AtividadeRepository Test', () {
     test("First Test", () {
       expect(repository, isInstanceOf<AtividadeRepository>());
     });

  });
}
