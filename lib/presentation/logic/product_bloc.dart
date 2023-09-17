import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/core/logging/custom_logger.dart';
import 'package:flutter_template/core/utils/dartz_x.dart';
import 'package:flutter_template/presentation/models/product-user-input-model.dart';

import '../../data/repositories/product_repository.dart';
import '../../domain/entities/product.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc({required this.productRepository}) : super(const ProductState()) {
    on<AddProductEvent>(_mapAddProductEventToState);
  }

  final ProductRepository productRepository;

  void _mapAddProductEventToState(
      AddProductEvent event, Emitter<ProductState> emit) async {
    emit(state.copyWith(status: ProductStatus.adding));
    final productEntity = _mapProductUserInputModelToEntity(event.productModel);

    // call repo
    final result = await productRepository.createProduct(productEntity);
    if (result.isLeft()) {
      emit(state.copyWith(
          status: ProductStatus.error,
          description: 'issue from backend service'));
    } else {
      emit(state.copyWith(
          status: ProductStatus.added,
          description: 'new product added to list'));
    }
  }

  // void _mapEventToState(ProductEvent event) async* {
  //   emit ProductAdding();
  //
  //
  //     // map UI model to model
  //     final productEntity =
  //         await _mapProductUserInputModelToEntity(event.productModel);
  //
  //

  //
  // }

  Product _mapProductUserInputModelToEntity(ProductUserInputModel inputModel) {
    // yeah, klunky for now
    Product model = Product(
        id: inputModel.id,
        name: inputModel.name,
        description: inputModel.description,
        topSeller: inputModel.topSeller,
        topRated: inputModel.topRated,
        color: inputModel.color,
        size: inputModel.size);

    return model;
  }
}
