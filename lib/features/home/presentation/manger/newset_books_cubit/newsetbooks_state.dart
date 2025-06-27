part of 'newsetbooks_cubit.dart';

abstract class NewsetbooksState extends Equatable {
  const NewsetbooksState();

  @override
  List<Object> get props => [];
}

class NewsetbooksInitial extends NewsetbooksState {}

class NewsetbooksLoading extends NewsetbooksState {}

class NewsetbooksFailure extends NewsetbooksState {
  final String errMessage;

  const NewsetbooksFailure(this.errMessage);
}

class NewsetbooksSuccess extends NewsetbooksState {
  final List<BookModel> books;

  const NewsetbooksSuccess(this.books);
}
