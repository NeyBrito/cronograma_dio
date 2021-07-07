import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meu_cronograma/app/domain/atividade_model.dart';
import 'package:meu_cronograma/app/domain/curso_model.dart';
import 'package:meu_cronograma/app/modules/atividade/dialog_atividade.dart';
import 'package:meu_cronograma/app/modules/atividade/progress_circle.dart';
import 'package:meu_cronograma/app/shared/background_box_decoration.dart';
import 'package:meu_cronograma/app/shared/widgets/logo_widget.dart';

import 'atividade_controller.dart';
import 'listagem_atividade.dart';

class AtividadePage extends StatefulWidget {
  final CursoModel curso;

  const AtividadePage({Key key, @required this.curso})
      : assert(curso != null, 'Curso não pode ser null');

  @override
  _AtividadePageState createState() => _AtividadePageState(curso);
}

class _AtividadePageState
    extends ModularState<AtividadePage, AtividadeController> {
  //use 'controller' variable to access controller
  final CursoModel curso;

  _AtividadePageState(this.curso);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: LogoWidget(
          image: CircleAvatar(child: curso.logoImage),
          title: curso.nome,
        ),
      ),
      body: Container(
        decoration: BackgroundBoxDecoration.getBoxDecoration(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Observer(
                  builder: (_) => ProgressCircle(
                      percentConcluido: controller.percentConcluido)),
              Expanded(child: ListagemAtividade(curso: curso)),
              MaterialButton(
                padding: const EdgeInsets.all(10.0),
                color: Colors.black54,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                onPressed: () => showDialog(
                    context: context,
                    builder: (BuildContext context) => DialogAtividade(
                        atividade: AtividadeModel.empty(idCurso: curso.id))),
                child: Text(
                  'Adicionar nova atividade',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              // ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
