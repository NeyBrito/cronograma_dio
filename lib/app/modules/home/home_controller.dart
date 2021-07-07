import 'package:flutter_modular/flutter_modular.dart';
import 'package:meu_cronograma/app/domain/curso_model.dart';
import 'package:meu_cronograma/app/repositories/interfaces/curso_repository_interface.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {

  final ICursoRepository _repository = Modular.get<ICursoRepository>();

  @observable
  String filter;

  @action
  void setFilter(String filter) {
    this.filter = filter;
  }

  Future<List<CursoModel>> findAllCursos(){
    return _repository.findAllCursos(filter);
  }

  void deleteCurso(CursoModel curso){
    _repository.deleteCurso(curso);
  }
}
