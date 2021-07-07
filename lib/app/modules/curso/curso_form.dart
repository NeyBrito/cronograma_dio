import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meu_cronograma/app/repositories/interfaces/curso_repository_interface.dart';

import '../../app_widget.dart';
import '../../domain/curso_model.dart';

class CursoForm extends StatefulWidget {
  final CursoModel curso;

  const CursoForm({Key key, this.curso}) : super(key: key);

  @override
  _CursoFormState createState() => _CursoFormState(curso);
}

class _CursoFormState extends State<CursoForm> {
  final ICursoRepository _repository = Modular.get<ICursoRepository>();

  final CursoModel curso;
  final _formKey = GlobalKey<FormState>();
  final picker = ImagePicker();

  _CursoFormState(this.curso);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Wrap(
          alignment: WrapAlignment.end,
          spacing: 20,
          runSpacing: 10,
          children: <Widget>[
            Observer(
              builder: (_) => Visibility(
                  visible: curso.logoImage != null,
                  child: GestureDetector(
                      onTap: () => updateImage(),
                      child: Center(
                        child: Container(
                            height: 200, width: 200, child: curso.logoImage),
                      ))),
            ),
            Observer(
                builder: (_) => TextFormField(
                      validator: textValidator(),
                      onChanged: updateNome,
                      initialValue: curso.nome,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: "Nome"),
                      maxLength: 100,
                    )),
            Observer(
                builder: (_) => TextFormField(
                      onChanged: updateLink,
                      initialValue: curso.link,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Link Curso"),
                      maxLength: 200,
                    )),
            Observer(
                builder: (_) => TextFormField(
                      validator: textValidator(),
                      onChanged: updateDescricao,
                      initialValue: curso.descricao,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: "Descrição"),
                      keyboardType: TextInputType.multiline,
                      maxLines: 8,
                      maxLength: 1000,
                    )),
            Center(
              child: SizedBox(
                width: double.infinity,
                child: MaterialButton(
                    color: AppWidget.color[400],
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _repository.save(curso);
                        Navigator.of(context)
                            .pushNamedAndRemoveUntil("/", (_) => false);
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.save),
                          SizedBox(width: 10),
                          Text(
                            'Salvar',
                            style: TextStyle(fontSize: 25.0),
                          ),
                        ],
                      ),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }

  void updateImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      curso.imagePath = pickedFile.path;
      curso.setLogoImage(Image.file(File(pickedFile.path)));
    }
  }

  void updateNome(nome) {
    curso.setNome(nome);
  }

  void updateLink(link) {
    curso.setLink(link);
  }

  void updateDescricao(descricao) {
    curso.setDescricao(descricao);
  }

  FieldValidator textValidator() {
    return MultiValidator([
      RequiredValidator(errorText: 'campo obrigatório'),
      MinLengthValidator(4, errorText: 'tamanho mínimo de 4 caracteres'),
    ]);
  }
}
