import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meu_cronograma/app/shared/background_box_decoration.dart';
import 'package:meu_cronograma/app/shared/widgets/logo_widget.dart';

import '../../app_module.dart';
import 'home_controller.dart';
import 'listagem_curso.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BackgroundBoxDecoration.getBoxDecoration(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SafeArea(child: LogoWidget()),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: _buildSearchFilter(),
              ),
              Expanded(child: ListagemCurso()),
              MaterialButton(
                padding: const EdgeInsets.all(10.0),
                color: Colors.black54,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                onPressed: () =>
                    Navigator.pushNamed(context, AppModule.NEW_CURSO),
                child: Text(
                  'Adicionar novo curso',
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

  Widget _buildSearchFilter() {
    return TextField(
      style: TextStyle(color: Colors.white, fontSize: 17.0),
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 2.0),
            borderRadius: const BorderRadius.all(
              const Radius.circular(30.0),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 2.0),
            borderRadius: const BorderRadius.all(
              const Radius.circular(30.0),
            ),
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white,
          ),
          hintStyle: TextStyle(color: Colors.white),
          hintText: 'Pesquise aqui'),
      onChanged: (filter) => _updateCursosList(filter),
    );
  }

  _updateCursosList(String filter) {
    controller.setFilter(filter);
  }
}
