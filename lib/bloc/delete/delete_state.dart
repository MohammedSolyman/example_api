part of 'delete_bloc.dart';

sealed class DeleteState extends Equatable {
  const DeleteState();

  @override
  List<Object> get props => [];
}

final class DeleteInitial extends DeleteState {}

final class DeleteLoading extends DeleteState {
  final int id;

  const DeleteLoading({required this.id});
  @override
  List<Object> get props => [];
}

final class DeleteNotLoading extends DeleteState {}

final class DeleteError extends DeleteState {
  final String error;

  const DeleteError({required this.error});

  @override
  List<Object> get props => [error];
}
