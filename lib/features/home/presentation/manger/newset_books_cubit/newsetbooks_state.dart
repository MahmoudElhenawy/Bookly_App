part of 'newsetbooks_cubit.dart';

abstract class NewsetbooksState extends Equatable {
  const NewsetbooksState();

  @override
  List<Object> get props => [];
}

class NewsetbooksInitial extends NewsetbooksState {}

class FeaturebooksLoading extends NewsetbooksState {}

class FeaturebooksFailure extends NewsetbooksState {
  final String errMessage;

  const FeaturebooksFailure(this.errMessage);
}

class FeaturebooksSuccess extends NewsetbooksState {
  final List<BookModel> books;

  const FeaturebooksSuccess(this.books);
}
