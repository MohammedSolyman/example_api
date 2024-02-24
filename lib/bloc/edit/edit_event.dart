part of 'edit_bloc.dart';

sealed class EditEvent extends Equatable {
  const EditEvent();

  @override
  List<Object> get props => [];
}

class UpdateProductEvent extends EditEvent {
  final Product product;
  const UpdateProductEvent({
    required this.product,
  });

  @override
  List<Object> get props => [product];
}
