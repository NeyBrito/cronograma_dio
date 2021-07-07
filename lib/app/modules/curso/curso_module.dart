import 'package:flutter_modular/flutter_modular.dart';

import 'curso_controller.dart';
import 'curso_page.dart';

class CursoModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $CursoController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => CursoPage(
                  curso: args.data,
                )),
      ];

  static Inject get to => Inject<CursoModule>.of();
}
