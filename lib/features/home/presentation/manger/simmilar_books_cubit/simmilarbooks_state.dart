part of 'simmilarbooks_cubit.dart';

abstract class SimmilarbooksState extends Equatable {
  const SimmilarbooksState();

  @override
  List<Object> get props => [];
}

class SimmilarbooksInitial extends SimmilarbooksState {}

class SimmilarbooksLoading extends SimmilarbooksState {}

class SimmilarbooksFailure extends SimmilarbooksState {
  final String errMessage;

  const SimmilarbooksFailure(this.errMessage);
}

class SimmilarbooksSuccess extends SimmilarbooksState {
  final List<BookModel> books;

  const SimmilarbooksSuccess(this.books);
}
