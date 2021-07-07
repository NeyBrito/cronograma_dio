import 'package:flutter_modular/flutter_modular.dart';
import 'package:meu_cronograma/app/domain/atividade_model.dart';
import 'package:meu_cronograma/app/domain/curso_model.dart';
import 'package:meu_cronograma/app/repositories/interfaces/atividade_repository_interface.dart';
import 'package:meu_cronograma/app/repositories/interfaces/curso_repository_interface.dart';
import 'package:mobx/mobx.dart';

part 'atividade_controller.g.dart';

@Injectable()
class AtividadeController = _AtividadeControllerBase with _$AtividadeController;

abstract class _AtividadeControllerBase with Store {
  final IAtividadeRepository _repository = Modular.get<IAtividadeRepository>();
  final ICursoRepository _cursoRepository = Modular.get<ICursoRepository>();

  @observable
  List<AtividadeModel> _atividades = ObservableList<AtividadeModel>.of([]);

  @observable
  double percentConcluido = 0.0;

  @action
  setPercentConcluido(double percentConcluido) async {
    this.percentConcluido = percentConcluido;
  }

  @action
  saveAtividade(AtividadeModel atividadeModel) async {
    int id = await _repository.saveAtividade(atividadeModel);
    atividadeModel.id = id;
    if (_atividades.contains(atividadeModel)) {
      _atividades.remove(atividadeModel);
    }
    _atividades.add(atividadeModel);

    updatePercentAtividadeConcluido();
    _cursoRepository.updatePercentConcluido(atividadeModel.idCurso, percentConcluido);

  }

  @action
  deleteAtividade(AtividadeModel atividade) {
    _repository.deleteAtividade(atividade);
    _atividades.remove(atividade);
    updatePercentAtividadeConcluido();
    _cursoRepository.updatePercentConcluido(atividade.idCurso, percentConcluido);

  }

  Future<List<AtividadeModel>> getAtividades(CursoModel curso) async {
    if (_atividades.isEmpty) {
      _atividades = ObservableList<AtividadeModel>.of(
          await _repository.findAllAtividadesByCurso(curso));
      updatePercentAtividadeConcluido();
    }
    _atividades.sort((a, b) => a.id.compareTo(b.id));
    return _atividades;
  }

  updateAtividadeStatus(AtividadeModel atividade, bool feito) {
    atividade.setFeito(feito);
    saveAtividade(atividade);
  }

  updatePercentAtividadeConcluido() {
    if (_atividades.isEmpty) {
      return setPercentConcluido(0);
    } else {
      var qtdAtividadeConcluido =
          _atividades.where((element) => element.feito == true).length;
      setPercentConcluido(
          (qtdAtividadeConcluido / _atividades.length).toDouble());
    }
  }
}
