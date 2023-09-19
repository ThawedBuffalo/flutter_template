// app specific imports
import 'package:dartz/dartz.dart';
import 'package:flutter_template/data/datasources/mock_product_local_data_source.dart';
import 'package:flutter_template/domain/repositories/product_repository_intf.dart';
import 'package:flutter_template/data/models/product-model.dart';
import '../../core/error/exceptions.dart';
import '../../core/error/failure.dart';
import '../../domain/entities/placeholder.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/placeholder_repository_intf.dart';
import '../datasources/placeholder_remote_data_source_intf.dart';
import '../models/placeholder_model.dart';

const String SERVER_FAILURE_MSG = 'server failure, please try again...';

class ProductRepository implements ProductRepositoryInterface {
  final MockProductLocalDataSource dataSource;

  ProductRepository({required this.dataSource});

  @override
  Future<Either<Failure, Product>> createProduct(Product product) async {
    // TODO: implement createProduct

    try {
      final productModel =
          await dataSource.createProduct(mapProductToProductModel(product));

      final productEntity = mapProductModelToProduct(productModel);
      return Right(productEntity);
    } on DataException {
      return Left(DataFailure(errorMessage: 'bad response from data server'));
    }
  }

  Product mapProductModelToProduct(ProductModel input) {
    // copy the User model to the User entity
    return Product(
        id: input.id,
        name: input.name,
        description: input.description,
        topSeller: input.topSeller,
        topRated: input.topRated,
        color: input.color,
        size: input.size);
  }

  ProductModel mapProductToProductModel(Product input) {
    // copy the User model to the User entity
    return ProductModel(
        id: input.id,
        name: input.name,
        description: input.description,
        topSeller: input.topSeller,
        topRated: input.topRated,
        color: input.color,
        size: input.size);
  }
}
