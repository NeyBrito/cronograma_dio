
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:meu_cronograma/app/app_widget.dart';
import 'package:meu_cronograma/app/domain/atividade_model.dart';
import 'package:meu_cronograma/app/modules/atividade/atividade_controller.dart';

class AtividadeForm extends StatefulWidget {
  final AtividadeModel atividade;

  const AtividadeForm({Key key, this.atividade}) : super(key: key);

  @override
  _AtividadeFormState createState() => _AtividadeFormState(this.atividade);
}

class _AtividadeFormState extends State<AtividadeForm> {

  final AtividadeController controller = Modular.get<AtividadeController>();

  final AtividadeModel atividade;
  final _formKey = GlobalKey<FormState>();

  _AtividadeFormState(this.atividade);

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
                builder: (_) => TextFormField(
                  validator: nomeValidator(),
                  onChanged: updateNome,
                  initialValue: atividade.nome,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Nome"),
                  maxLength: 100,
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
                        controller.saveAtividade(atividade);
                        Navigator.of(context).pop();
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

  void updateNome(nome) {
    atividade.setNome(nome);
  }

  FieldValidator nomeValidator() {
    return MultiValidator([
      RequiredValidator(errorText: 'campo obrigatório'),
      MinLengthValidator(4, errorText: 'tamanho mínimo de 4 caracteres'),
    ]);
  }
}
