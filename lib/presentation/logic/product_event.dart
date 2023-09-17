part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
}

class AddProductEvent extends ProductEvent {
  final ProductUserInputModel productModel;

  const AddProductEvent({required this.productModel});

  @override
  // TODO: implement props
  List<Object?> get props => [productModel];
}
