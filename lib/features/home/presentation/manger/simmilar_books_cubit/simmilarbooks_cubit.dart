import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'simmilarbooks_state.dart';

class SimmilarbooksCubit extends Cubit<SimmilarbooksState> {
  SimmilarbooksCubit(this.homeRepo) : super(SimmilarbooksInitial());
  final HomeRepo homeRepo;
  Future<void> ffetchSimmilarBookse({required String category}) async {
    emit(SimmilarbooksLoading());
    var result = await homeRepo.fetchSimmilarBooks(category: category);
    result.fold((Failure) {
      emit(SimmilarbooksFailure(Failure.errMessage));
    }, (books) {
      emit(SimmilarbooksSuccess(books));
    });
  }
}
