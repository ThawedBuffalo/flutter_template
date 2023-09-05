import 'dart:convert';
import 'dart:math';

// app specific imports
import 'package:flutter_template/core/error/exceptions.dart';
import 'package:flutter_template/data/datasources/product_local_data_source_intf.dart';
import 'package:flutter_template/data/models/placeholder_model.dart';
import 'package:flutter_template/data/models/product-model.dart';
import 'package:http/http.dart' as http;

import '../../core/logging/custom_logger.dart';

class MockProductLocalDataSource implements ProductLocalDataSourceInterface {
  MockProductLocalDataSource();

  @override
  Future<ProductModel> createProduct(ProductModel product) async {
    // mock a save state
    Map data = {'product': product};
    var bodyData = jsonEncode(data);

    try {
      CustomLogger.loggerNoStack.e('mocked product save returning...');
      // Mock a saved state, return the Product
      return ProductModel(
          id: Random().nextInt(10),
          name: product.name,
          description: product.description,
          topSeller: product.topSeller,
          topRated: product.topRated,
          color: product.color,
          size: product.size);
    } catch (e) {
      CustomLogger.loggerNoStack.e('server exception thrown: ' + e.toString());
      throw PlaceholderException();
    }
  }
}
