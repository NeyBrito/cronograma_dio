import 'package:flutter_modular/flutter_modular.dart';

import 'atividade_controller.dart';
import 'atividade_page.dart';

class AtividadeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $AtividadeController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => AtividadePage(curso: args.data,)),
      ];

  static Inject get to => Inject<AtividadeModule>.of();
}
