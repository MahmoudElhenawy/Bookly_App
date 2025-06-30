import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:bookly/core/errors/failuers.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/search/data/repos/search_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepo searchRepo;

  SearchCubit(this.searchRepo) : super(SearchInitial());

  void fetchSearchBooks(String query) async {
    emit(SearchLoading());
    Either<Failure, List<BookModel>> result =
        await searchRepo.fetchSearchBooks(query);

    result.fold(
      (failure) => emit(SearchFailure(failure.errMessage)),
      (books) => emit(SearchSuccess(books)),
    );
  }
}
