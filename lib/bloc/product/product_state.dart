part of 'product_bloc.dart';

sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

final class ProductInitial extends ProductState {}

final class ProductLoading extends ProductState {}

final class ProductError extends ProductState {
  final String error;
  const ProductError({required this.error});

  @override
  List<Object> get props => [error];
}

final class ProductSuccess extends ProductState {
  final List<Product> products;
  const ProductSuccess({required this.products});

  @override
  List<Object> get props => [products];
}
