import 'package:way_to_success/common/variables/app_variables.dart';
import 'package:way_to_success/core/error/exception.dart';
import 'package:way_to_success/features/cart/data/datasource/cart_local_datasource.dart';
import 'package:way_to_success/features/cart/data/models/cart_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class CartRemoteDatasource {
  Future<List<CartModel>> getItems(String path);
}

class CartRemoteDatasourceImpl implements CartRemoteDatasource {
  final http.Client client;
  final CartLocalDatasource cartLocalDatasource;

  CartRemoteDatasourceImpl(
      {required this.client, required this.cartLocalDatasource});

  @override
  Future<List<CartModel>> getItems(String path) async {
    final response = await client.get(Uri.parse(AppVariables.url + path),
        headers: {AppVariables.header: AppVariables.apikey});
    if (response.statusCode == 200) {
      List<dynamic> product = json.decode(response.body);
      cartLocalDatasource.insertElements(response.body);
      return product.map((element) => CartModel.fromJson(element)).toList();
    } else {
      throw ServerException();
    }
  }
}
