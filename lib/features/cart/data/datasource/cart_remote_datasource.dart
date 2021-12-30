import 'package:way_to_success/core/error/exception.dart';
import 'package:way_to_success/features/cart/data/models/cart_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class CartRemoteDatasource {
  Future<List<CartModel>> getItems(String path);
}

class CartRemoteDatasourceImpl implements CartRemoteDatasource {
  final http.Client client;

  CartRemoteDatasourceImpl({required this.client});
  @override
  Future<List<CartModel>> getItems(String path) async {
    final response = await client.get(
        Uri.parse('https://db2021ecom-edca.restdb.io/rest/$path'),
        headers: {'x-apikey': '2aa8e910f6c4ade81a84c9333ffc7bf6a398e'});
    if (response.statusCode == 200) {
      List<dynamic> product = json.decode(response.body);
      return product.map((element) => CartModel.fromJson(element)).toList();
    } else {
      throw ServerException();
    }
  }
}
