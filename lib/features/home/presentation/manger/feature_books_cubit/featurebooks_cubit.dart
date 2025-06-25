import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

part 'featurebooks_state.dart';

class FeaturebooksCubit extends Cubit<FeaturebooksState> {
  FeaturebooksCubit() : super(FeaturebooksInitial());
}
