import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'featurebooks_state.dart';

class FeaturebooksCubit extends Cubit<FeaturebooksState> {
  FeaturebooksCubit(this.homeRepo) : super(FeaturebooksInitial());
  final HomeRepo homeRepo;
  Future<void> fetchFeaturedBooks() async {
    emit(FeaturebooksLoading());
    var result = await homeRepo.fetchFeaturedBooks();
    result.fold((Failure) {
      emit(FeaturebooksFailure(Failure.errMessage));
    }, (books) {
      emit(FeaturebooksSuccess(books));
    });
  }
}
