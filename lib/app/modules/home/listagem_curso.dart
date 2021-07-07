import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:meu_cronograma/app/app_module.dart';
import 'package:meu_cronograma/app/domain/curso_model.dart';
import 'package:meu_cronograma/app/modules/home/home_controller.dart';
import 'package:meu_cronograma/app/modules/home/progress_list_bar.dart';
import 'package:meu_cronograma/app/modules/home/web_view_curso.dart';

class ListagemCurso extends StatefulWidget {
  @override
  _ListagemCursoState createState() => _ListagemCursoState();
}

class _ListagemCursoState extends State<ListagemCurso> {
  final HomeController controller = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) => FutureBuilder<List<CursoModel>>(
        future: controller.findAllCursos(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container();
          }
          return ListView.separated(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (builder, index) {
                CursoModel curso = snapshot.data[index];
                return Slidable(
                  actionPane: SlidableDrawerActionPane(),
                  actionExtentRatio: 0.25,
                  child: _buildListTile(curso, context),
                  actions: [
                    Visibility(
                      visible: curso.link != null,
                      child: IconSlideAction(
                        caption: 'Acessar',
                        color: Colors.yellow[600],
                        icon: Icons.send,
                        onTap: () => _navigateToWebView(curso.link, context),
                      ),
                    ),
                  ],
                  secondaryActions: <Widget>[
                    IconSlideAction(
                      caption: 'Editar',
                      color: Colors.black45,
                      icon: Icons.edit,
                      onTap: () => _navigateToEdit(curso, context),
                    ),
                    IconSlideAction(
                      caption: 'Deletar',
                      color: Colors.red,
                      icon: Icons.delete,
                      onTap: () => _deleteCurso(curso),
                    ),
                  ],
                );
              },
              separatorBuilder: (ctx, index) => Divider(),
              itemCount: snapshot.data.length);
        },
      ),
    );
  }

  ListTile _buildListTile(CursoModel curso, BuildContext context) {
    return ListTile(
      onTap: () => _navigateToAtividades(curso, context),
      leading: CircleAvatar(
        child: curso.logoImage,
      ),
      title: Text(
        curso.nome,
        style: TextStyle(color: Colors.white),
      ),
      subtitle: Column(
        children: [
          Text(
            curso.descricao,
            style: TextStyle(color: Colors.white70),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          Observer(
              builder: (_) =>
                  ProgressListBar(percentConcluido: curso.percentConcluido))
        ],
      ),
    );
  }

  _navigateToWebView(String url, BuildContext context) {
    return Navigator.of(context)
        .push(new MaterialPageRoute(builder: (_) => WebViewCurso(url: url)));
  }

  _navigateToEdit(CursoModel curso, BuildContext context) {
    Navigator.of(context).pushNamed(AppModule.NEW_CURSO, arguments: curso);
  }

  _deleteCurso(CursoModel curso) {
    setState(() {
      controller.deleteCurso(curso);
    });
  }

  _navigateToAtividades(CursoModel curso, BuildContext context) {
    Navigator.of(context).pushNamed(AppModule.ATIVIDADES, arguments: curso);
  }
}
