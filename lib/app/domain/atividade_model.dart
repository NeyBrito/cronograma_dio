import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'atividade_model.g.dart';

class AtividadeModel = BaseAtividadeModel with _$AtividadeModel;

abstract class BaseAtividadeModel with Store {

  int id;

  @observable
  String nome;

  @observable
  bool feito = false;

  int idCurso;

  @action
  setNome(String nome) {
    this.nome = nome;
  }

  @action
  setFeito(bool feito) {
    this.feito = feito;
  }

  BaseAtividadeModel.empty({@required this.idCurso});

  BaseAtividadeModel(
      {@required this.nome, @required this.idCurso, this.feito = false});

  BaseAtividadeModel.fromDb(Map<String, dynamic> map)
      : id = map['id'],
        nome = map['nome'],
        feito = map['feito'] == 'true',
        idCurso = map['idCurso'];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'feito': feito.toString(),
      'idCurso': idCurso,
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BaseAtividadeModel &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
