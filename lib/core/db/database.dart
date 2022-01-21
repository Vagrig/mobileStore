import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:way_to_success/common/variables/app_variables.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();

  static Database? _database;

  String elementsTable = AppVariables.table;
  String columnId = AppVariables.id;
  String homeName = AppVariables.home;
  String detailtName = AppVariables.detail;
  String cartName = AppVariables.cart;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDB();
    _database!.delete(elementsTable);
    return _database!;
  }

  Future<Database> _initDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + AppVariables.tablePath;
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  void _createDB(Database db, int version) async {
    await db.execute(
      '''CREATE TABLE $elementsTable(
        $columnId INTEGER PRIMARY KEY, $homeName TEXT, $detailtName TEXT, $cartName TEXT)''',
    );
  }
}
