import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../domain/curso_model.dart';
import 'curso_controller.dart';
import 'curso_form.dart';

class CursoPage extends StatefulWidget {

  final CursoModel curso;

  const CursoPage({Key key, this.curso}) : super(key: key);

  @override
  _CursoPageState createState() => _CursoPageState(this.curso?? CursoModel.empty());
}

class _CursoPageState extends ModularState<CursoPage, CursoController> {

  final CursoModel curso;

  _CursoPageState(this.curso);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Observer(builder: (_) => Text(curso.nome ?? ''))
      ),
      body: SingleChildScrollView(child: CursoForm(curso: curso)),
    );
  }
}
