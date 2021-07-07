import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:meu_cronograma/app/domain/atividade_model.dart';
import 'package:meu_cronograma/app/domain/curso_model.dart';
import 'package:meu_cronograma/app/modules/atividade/atividade_controller.dart';

import 'dialog_atividade.dart';

class ListagemAtividade extends StatelessWidget {
  final CursoModel curso;
  final AtividadeController _controller = Modular.get<AtividadeController>();

  ListagemAtividade({Key key, this.curso}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) {
        return FutureBuilder<List<AtividadeModel>>(
            future: _controller.getAtividades(curso),
            builder: (_, atividades) {
              if (!atividades.hasData) {
                return Container();
              }
              return _buildList(atividades.data, context);
            });
      },
    );
  }

  ListView _buildList(List<AtividadeModel> atividades, BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (builder, index) {
          AtividadeModel atividade = atividades[index];
          return Slidable(
            actionPane: SlidableDrawerActionPane(),
            actionExtentRatio: 0.25,
            child: Observer(
              builder: (BuildContext context) =>
                  CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text(
                      atividade.nome,
                      style: TextStyle(color: Colors.white),
                    ),
                    value: atividade.feito,
                    onChanged: (feito) => _controller.updateAtividadeStatus(atividade, feito),
                  ),
            ),
            secondaryActions: <Widget>[
              IconSlideAction(
                caption: 'Editar',
                color: Colors.black45,
                icon: Icons.edit,
                onTap: () =>
                    showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            DialogAtividade(atividade: atividade)),
              ),
              IconSlideAction(
                caption: 'Deletar',
                color: Colors.red,
                icon: Icons.delete,
                onTap: () => _deleteAtividade(atividade),
              ),
            ],
          );
        },
        separatorBuilder: (ctx, index) => Divider(),
        itemCount: atividades.length);
  }

  _deleteAtividade(AtividadeModel atividade) {
    _controller.deleteAtividade(atividade);
  }
}
