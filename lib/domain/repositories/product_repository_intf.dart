import 'package:dartz/dartz.dart';
import 'package:flutter_template/data/models/product-model.dart';

import '../../core/error/failure.dart';
import '../entities/product.dart';

abstract class ProductRepositoryInterface {
  Future<Either<Failure, Product>> createProduct(Product product);
}
