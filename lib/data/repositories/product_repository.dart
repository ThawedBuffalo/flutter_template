// app specific imports
import 'package:dartz/dartz.dart';
import 'package:flutter_template/data/datasources/mock_product_local_data_source.dart';
import 'package:flutter_template/domain/repositories/product_repository_intf.dart';
import 'package:flutter_template/data/models/product-model.dart';

import '../../core/error/exceptions.dart';
import '../../core/error/failure.dart';
import '../../domain/entities/placeholder.dart';
import '../../domain/repositories/placeholder_repository_intf.dart';
import '../datasources/placeholder_remote_data_source_intf.dart';
import '../models/placeholder_model.dart';

const String SERVER_FAILURE_MSG = 'server failure, please try again...';

class ProductRepository implements ProductRepositoryInterface {
  final MockProductLocalDataSource dataSource;

  ProductRepository({required this.dataSource});

  @override
  Future<Either<Failure, ProductModel>> createProduct(
      ProductModel product) async {
    // TODO: implement createProduct

    final result = await dataSource.createProduct(product);
    return Right(result);
  }

  Placeholder mapPlaceholderModelToPlaceholderEntity(PlaceholderModel input) {
    // copy the User model to the User entity
    return Placeholder(
        placeholderId: input.placeholderId,
        placeholderName: input.placeholderName,
        optionalPlaceholder: null);
  }
}
