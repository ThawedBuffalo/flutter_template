part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();
}

class ProductInitial extends ProductState {
  @override
  List<Object> get props => [];
}

class ProductAdding extends ProductState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class ProductAdded extends ProductState {
  final ProductModel productModel;
  const ProductAdded(this.productModel);

  @override
  // TODO: implement props
  List<Object?> get props => [productModel];
}

class ProductError extends ProductState {
  final String message;
  const ProductError(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
