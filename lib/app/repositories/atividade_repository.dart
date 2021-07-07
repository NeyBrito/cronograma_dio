import 'package:meu_cronograma/app/domain/atividade_model.dart';
import 'package:meu_cronograma/app/domain/curso_model.dart';
import 'package:meu_cronograma/app/repositories/constants.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common/sqlite_api.dart';

import 'interfaces/atividade_repository_interface.dart';


class AtividadeRepository implements IAtividadeRepository {


  Future<Database> getDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, Constants.DATABASE_NAME);
    return openDatabase(path, version: 1);
  }

  @override
  void dispose() {
    //dispose will be called automatically
  }


  @override
  void deleteAtividade(AtividadeModel atividade) async {
    final db = await getDatabase();
    db.delete(Constants.ATIVIDADE_TABLE,
        where: 'id = ?', whereArgs: [atividade.id]);
  }

  @override
  Future<int> saveAtividade(AtividadeModel atividade) async {
    final db = await getDatabase();
    int id;
    var atividades = await getAtividadesDb(atividade.idCurso);
    if (atividades.contains(atividade)) {
      db.update(Constants.ATIVIDADE_TABLE, atividade.toMap(),
          where: 'id = ?', whereArgs: [atividade.id]);
      id = atividade.id;
    } else {
      id = await db.insert(Constants.ATIVIDADE_TABLE, atividade.toMap());
    }
    return id;
  }

  @override
  Future<List<AtividadeModel>> findAllAtividadesByCurso(
      CursoModel curso) async {
    return await getAtividadesDb(curso.id);
  }

  Future<List<AtividadeModel>> getAtividadesDb(int idCurso) async {
    final db = await getDatabase();
    List<Map> list = await db.rawQuery(
        "SELECT * FROM ${Constants.ATIVIDADE_TABLE} WHERE idCurso = ?",
        [idCurso]);
    return list.map((e) => AtividadeModel.fromDb(e)).toList();
  }
}
