part of 'edit_bloc.dart';

sealed class EditState extends Equatable {
  const EditState();

  @override
  List<Object> get props => [];
}

final class EditInitial extends EditState {}

final class EditError extends EditState {
  final String error;

  const EditError({required this.error});

  @override
  List<Object> get props => [error];
}

final class EditLoading extends EditState {
  final int id;

  const EditLoading({required this.id});
  @override
  List<Object> get props => [id];
}

final class EditNotLoading extends EditState {}
