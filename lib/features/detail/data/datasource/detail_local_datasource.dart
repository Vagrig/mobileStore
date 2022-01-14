import 'dart:convert';
import 'package:sqflite/sqlite_api.dart';
import 'package:way_to_success/core/db/database.dart';
import 'package:way_to_success/features/detail/data/models/detail_model.dart';
import 'package:way_to_success/features/detail/domain/entities/detail_entity.dart';

abstract class DetailLocalDatasource {
  Future<int> insertElements(String text);
  Future<List<DetailEntity>> getElements();
}

class DetailLocalDatasourceImpl implements DetailLocalDatasource {
  final data = DBProvider.db;

  @override
  Future<int> insertElements(String text) async {
    Database db = await data.database;

    var value = {'detail': text};
    return await db.insert(data.elementsTable, value);
  }

  @override
  Future<List<DetailEntity>> getElements() async {
    Database db = await data.database;
    final List<Map<String, dynamic>> elementsMapList =
        await db.query(data.elementsTable);
    String text = elementsMapList.elementAt(1)['detail'];
    List<dynamic> product = json.decode(text);
    final local =
        product.map((element) => DetailModel.fromJson(element)).toList();
    return local;
  }
}
