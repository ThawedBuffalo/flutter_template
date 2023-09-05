import '../models/product-model.dart';

abstract class ProductLocalDataSourceInterface {
  Future<ProductModel> createProduct(ProductModel product);
}
