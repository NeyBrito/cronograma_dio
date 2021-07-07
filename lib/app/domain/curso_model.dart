import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'curso_model.g.dart';

class CursoModel = BaseCursoModel with _$CursoModel;

abstract class BaseCursoModel with Store {
  int id;

  @observable
  String nome;

  @observable
  String descricao;

  @observable
  String link;

  @observable
  double percentConcluido = 0.0;

  @observable
  Image logoImage = Image.asset("assets/images/camera-empty.png");

  String imagePath;

  @action
  setDescricao(String descricao) {
    this.descricao = descricao;
  }

  @action
  setNome(String nome) {
    this.nome = nome;
  }

  @action
  setLink(String link) {
    this.link = link;
  }

  @action
  setLogoImage(Image logoImage) {
    this.logoImage = logoImage;
  }

  @action
  setPercentConcluido(double percentConcluido) {
    this.percentConcluido = percentConcluido;
  }

  BaseCursoModel.empty();

  BaseCursoModel.fromDb(Map<String, dynamic> map)
      : id = map['id'],
        nome = map['nome'],
        descricao = map['descricao'],
        link = map['link'],
        percentConcluido = map['atividadesFeitas'] == null
            ? 0
            : map['atividadesFeitas'] / map['todasAtividades'],
        imagePath = map['imagePath'],
        logoImage = map['imagePath'] != null
            ? Image.file(File(map['imagePath']))
            : Image.asset("assets/images/camera-empty.png");

  BaseCursoModel(
      {@required this.id,
      @required this.nome,
      @required this.descricao,
      this.percentConcluido,
      this.link,
      this.imagePath,
      this.logoImage});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'descricao': descricao,
      'link': link,
      'imagePath': imagePath,
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BaseCursoModel &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
