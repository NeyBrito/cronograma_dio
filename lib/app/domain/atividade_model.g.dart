// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'atividade_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AtividadeModel on BaseAtividadeModel, Store {
  final _$nomeAtom = Atom(name: 'BaseAtividadeModel.nome');

  @override
  String get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(String value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  final _$feitoAtom = Atom(name: 'BaseAtividadeModel.feito');

  @override
  bool get feito {
    _$feitoAtom.reportRead();
    return super.feito;
  }

  @override
  set feito(bool value) {
    _$feitoAtom.reportWrite(value, super.feito, () {
      super.feito = value;
    });
  }

  final _$BaseAtividadeModelActionController =
      ActionController(name: 'BaseAtividadeModel');

  @override
  dynamic setNome(String nome) {
    final _$actionInfo = _$BaseAtividadeModelActionController.startAction(
        name: 'BaseAtividadeModel.setNome');
    try {
      return super.setNome(nome);
    } finally {
      _$BaseAtividadeModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFeito(bool feito) {
    final _$actionInfo = _$BaseAtividadeModelActionController.startAction(
        name: 'BaseAtividadeModel.setFeito');
    try {
      return super.setFeito(feito);
    } finally {
      _$BaseAtividadeModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nome: ${nome},
feito: ${feito}
    ''';
  }
}
