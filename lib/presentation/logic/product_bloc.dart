import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_template/core/helpers/dartz_x.dart';
import 'package:flutter_template/data/models/product-model.dart';
import 'package:flutter_template/presentation/models/product-user-input-model.dart';

import '../../data/repositories/product_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;

  ProductBloc(this.productRepository) : super(ProductInitial());

  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    yield ProductAdding();

    if (event is AddProductEvent) {
      // map UI model to model
      final productEntity =
          await _mapProductUserInputModelToModel(event.productUIModel);
      final result = await productRepository.createProduct(productEntity);

      if (result.isLeft()) {
        yield const ProductError('error');
      } else if (result.isRight()) {
        yield ProductAdded(result.asRight());
      }
    }
  }

  Future<ProductModel> _mapProductUserInputModelToModel(ProductUserInputModel inputModel) async {
    // yeah, klunky for now
    ProductModel productModel = ProductModel(
        id: inputModel.id,
        name: inputModel.name,
        description: inputModel.description,
        topSeller: inputModel.topSeller,
        topRated: inputModel.topRated,
        color: inputModel.color,
        size: inputModel.size);

    return productModel;
  }
}
