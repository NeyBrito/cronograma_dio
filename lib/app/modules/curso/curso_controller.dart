import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'curso_controller.g.dart';

@Injectable()
class CursoController = _CursoControllerBase with _$CursoController;

abstract class _CursoControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
