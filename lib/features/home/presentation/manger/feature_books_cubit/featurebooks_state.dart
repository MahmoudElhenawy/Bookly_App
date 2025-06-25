part of 'featurebooks_cubit.dart';

abstract class FeaturebooksState extends Equatable {
  const FeaturebooksState();

  @override
  List<Object> get props => [];
}

class FeaturebooksInitial extends FeaturebooksState {}

class FeaturebooksLoading extends FeaturebooksState {}

class FeaturebooksFailure extends FeaturebooksState {
  final String errMessage;

  const FeaturebooksFailure(this.errMessage);
}

class FeaturebooksSuccess extends FeaturebooksState {
  final List<BookModel> books;

  const FeaturebooksSuccess(this.books);
}
