import 'dart:convert';
import 'package:way_to_success/common/variables/app_variables.dart';
import 'package:way_to_success/core/error/exception.dart';
import 'package:way_to_success/features/detail/data/datasource/detail_local_datasource.dart';
import 'package:way_to_success/features/detail/data/models/detail_model.dart';
import 'package:http/http.dart' as http;

abstract class DetailRemoteDatasource {
  Future<List<DetailModel>> getItems(String path);
}

class DetailRemoteDatasourceImpl implements DetailRemoteDatasource {
  final http.Client client;
  final DetailLocalDatasource detailLocalDatasource;

  DetailRemoteDatasourceImpl(
      {required this.client, required this.detailLocalDatasource});

  @override
  Future<List<DetailModel>> getItems(String path) async {
    final response = await client.get(Uri.parse(AppVariables.url + path),
        headers: {AppVariables.header: AppVariables.apikey});
    if (response.statusCode == 200) {
      List<dynamic> product = json.decode(response.body);
      detailLocalDatasource.insertElements(response.body);
      return product.map((element) => DetailModel.fromJson(element)).toList();
    } else {
      throw ServerException();
    }
  }
}
