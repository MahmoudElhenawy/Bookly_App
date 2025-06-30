import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/search/data/repos/search_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepo searchRepo;
  Timer? _debounce;

  SearchCubit(this.searchRepo) : super(SearchInitial());

  void fetchSearchBooks(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () async {
      if (query.isEmpty) {
        emit(SearchInitial());
        return;
      }
      emit(SearchLoading());
      var result = await searchRepo.fetchSearchBooks(query);

      result.fold(
        (failure) => emit(SearchFailure(failure.errMessage)),
        (books) => emit(SearchSuccess(books)),
      );
    });
  }
}
