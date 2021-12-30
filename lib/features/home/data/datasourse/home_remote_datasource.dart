import 'dart:convert';
import 'package:way_to_success/core/error/exception.dart';
import 'package:way_to_success/features/home/data/models/home_model.dart';
import 'package:http/http.dart' as http;

abstract class HomeRemoteDatasource {
  Future<List<HomeModel>> getItems(String path);
}

class HomeRemoteDatasourceImpl implements HomeRemoteDatasource {
  final http.Client client;

  HomeRemoteDatasourceImpl({required this.client});

  @override
  Future<List<HomeModel>> getItems(String path) async {
    final response = await client.get(
        Uri.parse('https://db2021ecom-edca.restdb.io/rest/$path'),
        headers: {'x-apikey': '2aa8e910f6c4ade81a84c9333ffc7bf6a398e'});

    if (response.statusCode == 200) {
      List<dynamic> product = json.decode(response.body);
      return product.map((element) => HomeModel.fromJson(element)).toList();
    } else {
      throw ServerException();
    }
  }
}
