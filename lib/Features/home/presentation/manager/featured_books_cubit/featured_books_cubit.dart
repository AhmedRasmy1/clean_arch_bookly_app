// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:bookly/Features/home/data/repositores/home_repo_impl.dart';
import 'package:bookly/Features/home/domian/entities/entity_book.dart';
import 'package:bookly/Features/home/domian/usecases/featch_newest_use_case.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(
    this.featchNewestBooksUseCase,
  ) : super(FeaturedBooksInitial());
  final FeatchNewestBooksUseCase featchNewestBooksUseCase;

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    var result = await featchNewestBooksUseCase.call();
    result.fold((failure) {
      emit(
        FeaturedBooksFailure(failure.errorMessage),
      );
    }, (books) {
      emit(
        FeaturedBooksSuccess(books),
      );
    });
  }
}
