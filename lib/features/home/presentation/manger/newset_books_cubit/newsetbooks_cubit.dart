import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'newsetbooks_state.dart';

class NewsetbooksCubit extends Cubit<NewsetbooksState> {
  NewsetbooksCubit(this.homeRepo) : super(NewsetbooksInitial());
  final HomeRepo homeRepo;
  Future<void> fetchNewsetBooks() async {
    emit(NewsetbooksLoading());
    var result = await homeRepo.fetchNewsetBooks();
    result.fold((Failure) {
      emit(NewsetbooksFailure(Failure.errMessage));
    }, (books) {
      emit(NewsetbooksSuccess(books));
    });
  }
}
