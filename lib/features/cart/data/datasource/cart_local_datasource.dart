import 'dart:convert';
import 'dart:developer';
import 'package:sqflite/sqlite_api.dart';
import 'package:way_to_success/common/variables/app_variables.dart';
import 'package:way_to_success/core/db/database.dart';
import 'package:way_to_success/features/cart/data/models/cart_model.dart';
import 'package:way_to_success/features/cart/domain/entities/cart_entity.dart';

abstract class CartLocalDatasource {
  Future<int> insertElements(String text);
  Future<List<CartEntity>> getElements();
}

class CartLocalDatasourceImpl implements CartLocalDatasource {
  final data = DBProvider.db;

  @override
  Future<int> insertElements(String text) async {
    Database db = await data.database;
    var value = {AppVariables.cart: text};
    return await db.insert(data.elementsTable, value);
  }

  @override
  Future<List<CartEntity>> getElements() async {
    Database db = await data.database;
    final List<Map<String, dynamic>> elementsMapList =
        await db.query(data.elementsTable);
    String listElements = elementsMapList.elementAt(2)[AppVariables.cart];
    List<dynamic> product = json.decode(listElements);
    final local =
        product.map((element) => CartModel.fromJson(element)).toList();
    return local;
  }
}
