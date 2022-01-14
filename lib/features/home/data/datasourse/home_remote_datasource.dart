import 'dart:convert';
import 'package:way_to_success/core/error/exception.dart';
import 'package:way_to_success/features/home/data/datasourse/home_local_datasource.dart';
import 'package:way_to_success/features/home/data/models/home_model.dart';
import 'package:http/http.dart' as http;

abstract class HomeRemoteDatasource {
  Future<List<HomeModel>> getItems(String path);
}

class HomeRemoteDatasourceImpl implements HomeRemoteDatasource {
  final http.Client client;
  final HomeLocalDatasource homeLocalDatasource;

  HomeRemoteDatasourceImpl(
      {required this.client, required this.homeLocalDatasource});

  @override
  Future<List<HomeModel>> getItems(String path) async {
    final response = await client.get(
        Uri.parse('https://shopapi-0575.restdb.io/rest/$path'),
        headers: {'x-apikey': '61ddae2e95cb716ea5ee48e4'});

    if (response.statusCode == 200) {
      List<dynamic> product = json.decode(response.body);
      homeLocalDatasource.insertElements(response.body);
      return product.map((element) => HomeModel.fromJson(element)).toList();
    } else {
      throw ServerException();
    }
  }
}
