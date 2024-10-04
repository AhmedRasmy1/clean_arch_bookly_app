import 'package:bookly/Features/home/domian/entities/entity_book.dart';
import 'package:bookly/Features/home/domian/repos/home_repo.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

class FeatchFeatuerdBooksUseCase {
  final HomeRepo homeRepo;

  FeatchFeatuerdBooksUseCase(this.homeRepo);
  Future<Either<Failure, List<EntityBook>>> fetchFeaturedBooks() {
    //check if there is permission
    return homeRepo.fetchFeaturedBooks();
  }
}
