// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'atividade_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $AtividadeController = BindInject(
  (i) => AtividadeController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AtividadeController on _AtividadeControllerBase, Store {
  final _$_atividadesAtom = Atom(name: '_AtividadeControllerBase._atividades');

  @override
  List<AtividadeModel> get _atividades {
    _$_atividadesAtom.reportRead();
    return super._atividades;
  }

  @override
  set _atividades(List<AtividadeModel> value) {
    _$_atividadesAtom.reportWrite(value, super._atividades, () {
      super._atividades = value;
    });
  }

  final _$percentConcluidoAtom =
      Atom(name: '_AtividadeControllerBase.percentConcluido');

  @override
  double get percentConcluido {
    _$percentConcluidoAtom.reportRead();
    return super.percentConcluido;
  }

  @override
  set percentConcluido(double value) {
    _$percentConcluidoAtom.reportWrite(value, super.percentConcluido, () {
      super.percentConcluido = value;
    });
  }

  final _$setPercentConcluidoAsyncAction =
      AsyncAction('_AtividadeControllerBase.setPercentConcluido');

  @override
  Future setPercentConcluido(double percentConcluido) {
    return _$setPercentConcluidoAsyncAction
        .run(() => super.setPercentConcluido(percentConcluido));
  }

  final _$saveAtividadeAsyncAction =
      AsyncAction('_AtividadeControllerBase.saveAtividade');

  @override
  Future saveAtividade(AtividadeModel atividadeModel) {
    return _$saveAtividadeAsyncAction
        .run(() => super.saveAtividade(atividadeModel));
  }

  final _$_AtividadeControllerBaseActionController =
      ActionController(name: '_AtividadeControllerBase');

  @override
  dynamic deleteAtividade(AtividadeModel atividade) {
    final _$actionInfo = _$_AtividadeControllerBaseActionController.startAction(
        name: '_AtividadeControllerBase.deleteAtividade');
    try {
      return super.deleteAtividade(atividade);
    } finally {
      _$_AtividadeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
percentConcluido: ${percentConcluido}
    ''';
  }
}
