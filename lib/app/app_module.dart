import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meu_cronograma/app/app_widget.dart';
import 'package:meu_cronograma/app/modules/atividade/atividade_module.dart';
import 'package:meu_cronograma/app/modules/curso/curso_module.dart';
import 'package:meu_cronograma/app/modules/home/home_module.dart';
import 'package:meu_cronograma/app/repositories/interfaces/atividade_repository_interface.dart';
import 'package:meu_cronograma/app/repositories/interfaces/curso_repository_interface.dart';

import 'app_controller.dart';
import 'repositories/atividade_repository.dart';
import 'repositories/curso_repository.dart';

class AppModule extends MainModule {
  static const String NEW_CURSO = "/curso";
  static const String ATIVIDADES = "/atividades";

  @override
  List<Bind> get binds => [
        Bind<IAtividadeRepository>((i) => new AtividadeRepository()),
        Bind<ICursoRepository>((i) => new CursoRepository()),
        $AppController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: HomeModule()),
        ModularRouter(NEW_CURSO, module: CursoModule()),
        ModularRouter(ATIVIDADES, module: AtividadeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
