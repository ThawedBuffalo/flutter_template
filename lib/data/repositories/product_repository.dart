// app specific imports
import 'package:dartz/dartz.dart';
import 'package:flutter_template/domain/repositories/product_repository_intf.dart';
import 'package:flutter_template/presentation/pages/page-1/product-model.dart.dart';

import '../../core/error/exceptions.dart';
import '../../core/error/failure.dart';
import '../../domain/entities/placeholder.dart';
import '../../domain/repositories/placeholder_repository_intf.dart';
import '../datasources/placeholder_remote_data_source_intf.dart';
import '../models/placeholder_model.dart';

const String SERVER_FAILURE_MSG =
    'server failure, please try again...';

class ProductRepository implements ProductRepositoryInterface {
  final PlaceholderRemoteDataSourceInterface placeholderDataSource;

  ProductRepository({required this.placeholderDataSource});

  @override
  Future<Either<Failure, ProductModel>> createProduct(ProductModel product) async {
    // TODO: implement createProduct
    try {
      final result = await
    }
  }


  @override
  Future<Either<Failure, Placeholder>> getPlaceholderDataWithParams(
      String placeholderParam) async {
    try {
      final result = await placeholderDataSource
          .getRemotePlaceholderDataWithParam(placeholderParam);
      final placeHolderEntity = mapPlaceholderModelToPlaceholderEntity(result);

      return Right(placeHolderEntity);
    } on PlaceholderException {
      return Left(PlaceholderFailure(errorMessage: SERVER_FAILURE_MSG));
    }
  }

  Placeholder mapPlaceholderModelToPlaceholderEntity(PlaceholderModel input) {
    // copy the User model to the User entity
    return Placeholder(
        placeholderId: input.placeholderId,
        placeholderName: input.placeholderName,
        optionalPlaceholder: null);
  }

  @override
  Future<Either<Failure, Placeholder>> getPlaceholderDataWithoutParams() {
    // TODO: implement getPlaceholderDataWithoutParams
    throw UnimplementedError();
  }


}
