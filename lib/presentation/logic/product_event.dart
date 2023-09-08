part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
}

class AddProductEvent extends ProductEvent {
  final ProductUserInputModel productUIModel;
  const AddProductEvent(this.productUIModel);

  @override
  // TODO: implement props
  List<Object?> get props => [productUIModel];
}
