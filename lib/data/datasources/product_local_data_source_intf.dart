import '../models/product-model.dart.dart';

abstract class ProductLocalDataSourceInterface {
  Future<ProductModel> createProduct(
      ProductModel product);
}
