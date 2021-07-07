import 'package:flutter_modular/flutter_modular.dart';
import 'package:meu_cronograma/app/domain/atividade_model.dart';
import 'package:meu_cronograma/app/domain/curso_model.dart';

abstract class IAtividadeRepository implements Disposable {

  Future<int> saveAtividade(AtividadeModel atividade);

  Future<List<AtividadeModel>> findAllAtividadesByCurso(CursoModel curso);

  void deleteAtividade(AtividadeModel atividade);
}
