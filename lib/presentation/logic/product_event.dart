part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
}

class AddProductEvent extends ProductEvent {
  final ProductModel productModel;
  const AddProductEvent(this.productModel);

  @override
  // TODO: implement props
  List<Object?> get props => [productModel];
}
