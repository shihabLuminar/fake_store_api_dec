import 'dart:convert';

import 'package:fake_store_api_dec/model/home_screen_models/products_res_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreenController with ChangeNotifier {
  List<ProductsResModel> productsList = [];
  fetchData() async {
    var url = Uri.parse("https://fakestoreapi.com/products");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body) as List;

      productsList = decodedData
          .map<ProductsResModel>(
              (element) => ProductsResModel.fromJson(element))
          .toList();
      print(productsList[1].category);
      notifyListeners();
    }
  }
}
