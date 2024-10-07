// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:bookly/Features/home/domian/entities/entity_book.dart';
import 'package:bookly/Features/home/domian/usecases/featch_featuerd_books_use_case.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(
    this.featchFeatuerdBooksUseCase,
  ) : super(FeaturedBooksInitial());
  final FeatchFeatuerdBooksUseCase featchFeatuerdBooksUseCase;

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    var result = await featchFeatuerdBooksUseCase.call();
    result.fold((failure) {
      emit(
        FeaturedBooksFailure(failure.errorMessage),
      );
    }, (featuredBooks) {
      emit(
        FeaturedBooksSuccess(featuredBooks),
      );
    });
  }
}
