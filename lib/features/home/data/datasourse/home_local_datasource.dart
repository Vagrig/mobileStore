import 'dart:convert';
import 'package:sqflite/sqlite_api.dart';
import 'package:way_to_success/core/db/database.dart';
import 'package:way_to_success/features/home/data/models/home_model.dart';
import 'package:way_to_success/features/home/domain/entities/home_entity.dart';

abstract class HomeLocalDatasource {
  Future<int> insertElements(String text);
  Future<List<HomeEntity>> getElements();
}

class HomeLocalDatasourceImpl implements HomeLocalDatasource {
  final data = DBProvider.db;

  @override
  Future<int> insertElements(String text) async {
    Database db = await data.database;
    var value = {'home': text};
    return await db.insert(data.elementsTable, value);
  }

  @override
  Future<List<HomeEntity>> getElements() async {
    Database db = await data.database;
    final List<Map<String, dynamic>> elementsMapList =
        await db.query(data.elementsTable);
    String text = elementsMapList.elementAt(0)['home'];
    List<dynamic> product = json.decode(text);
    final local =
        product.map((element) => HomeModel.fromJson(element)).toList();
    return local;
  }
}
