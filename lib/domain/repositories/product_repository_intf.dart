import 'package:dartz/dartz.dart';
import 'package:flutter_template/presentation/pages/page-1/product-model.dart.dart';

import '../../core/error/failure.dart';
import '../entities/placeholder.dart';

abstract class ProductRepositoryInterface {
  Future<Either<Failure, ProductModel>> createProduct(ProductModel product);
}
