import 'package:bookly/Features/home/domian/entities/entity_book.dart';
import 'package:bookly/Features/home/domian/repositories/home_repo.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';

class FeatchNewestBooksUseCase extends UseCase<List<EntityBook>, NoParam> {
  final HomeRepo homeRepo;

  FeatchNewestBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<EntityBook>>> call([NoParam? param]) {
    return homeRepo.fetchNewestBooks();
  }
}
