import 'package:flutter_modular/flutter_modular.dart';
import 'package:meu_cronograma/app/domain/curso_model.dart';

abstract class ICursoRepository implements Disposable {
  void save(CursoModel curso);

  Future<List<CursoModel>> findAllCursos(String filter);

  void deleteCurso(CursoModel curso);

  void updatePercentConcluido(int idCurso, double percentConcluido);
}
