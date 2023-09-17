part of 'product_bloc.dart';

enum ProductStatus { initial, adding, added, error }

extension ProductStatusX on ProductStatus {
  bool get isInitial => this == ProductStatus.initial;
  bool get isAdding => this == ProductStatus.adding;
  bool get isAdded => this == ProductStatus.added;
  bool get isError => this == ProductStatus.error;
}

class ProductState extends Equatable {
  final ProductStatus status;
  final String description;

  const ProductState(
      {this.status = ProductStatus.initial,
      this.description = 'initial state'});

  @override
  // TODO: implement props
  List<Object?> get props => [status, description];

  ProductState copyWith({ProductStatus? status, String? description}) {
    return ProductState(
        status: status ?? this.status,
        description: description ?? this.description);
  }
}

//
// class ProductInitial extends ProductState {
//   @override
//   List<Object> get props => [];
// }
//
// class ProductAdding extends ProductState {
//   @override
//   // TODO: implement props
//   List<Object?> get props => throw UnimplementedError();
// }
//
// class ProductAdded extends ProductState {
//   final Product product;
//   const ProductAdded(this.product);
//
//   @override
//   // TODO: implement props
//   List<Object?> get props => [product];
// }
//
// class ProductError extends ProductState {
//   final String message;
//   const ProductError(this.message);
//
//   @override
//   // TODO: implement props
//   List<Object?> get props => [message];
// }
