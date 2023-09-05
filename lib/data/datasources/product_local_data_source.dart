import 'dart:convert';

// app specific imports
import 'package:flutter_template/core/error/exceptions.dart';
import 'package:flutter_template/data/datasources/placeholder_remote_data_source_intf.dart';
import 'package:flutter_template/data/datasources/product_local_data_source_intf.dart';
import 'package:flutter_template/data/models/placeholder_model.dart';
import 'package:flutter_template/data/models/product-model.dart.dart';
import 'package:http/http.dart' as http;

import '../../core/logging/custom_logger.dart';

// TODO- ensure to change to https once webservice is updated
const PLACEHOLDER_API = 'http://api.palceholder.com:4000/api/v1/whatevers';

class ProductLocalDataSource
    implements ProductLocalDataSourceInterface {

  ProductLocalDataSource();

  @override
  Future<ProductModel> createProduct(ProductModel product) async {

    // mock a save state
    Map data = {'product': product};

    var bodyData = jsonEncode(data);

    try {

      // Mock a saved state, return the Product

      if (response.statusCode == 200) {
        return PlaceholderModel.fromJson(json.decode(response.body));
      } else if (response.statusCode == 101) {
        CustomLogger.loggerNoStack.e('server exception thrown: ' +
            response.statusCode.toString() +
            ' body: ' +
            response.body);
        throw PlaceholderException();
      } else {
        CustomLogger.loggerNoStack.e('server exception thrown: ' +
            response.statusCode.toString() +
            ' body: ' +
            response.body);
        throw PlaceholderException();
      }
    } catch (e) {
      CustomLogger.loggerNoStack.e('server exception thrown: ' + e.toString());
      throw PlaceholderException();
    }
  }
}
