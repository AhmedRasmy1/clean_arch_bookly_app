// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:bookly/Features/home/domian/entities/entity_book.dart';
import 'package:bookly/Features/home/domian/usecases/featch_newest_use_case.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(
    this.featchNewestBooksUseCase,
  ) : super(NewestBooksInitial());

  final FeatchNewestBooksUseCase featchNewestBooksUseCase;

  Future<void> featchNewestBooks() async {
    emit(NewestBooksLoading());
    var result = await featchNewestBooksUseCase.call();
    result.fold((failuer) {
      emit(NewestBooksFailure(failuer.errorMessage));
    }, (newestBooks) {
      emit(NewestBooksSuccess(newestBooks));
    });
  }
}
