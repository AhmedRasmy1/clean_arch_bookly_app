import '../entities/entity_book.dart';
import '../repositories/home_repo.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';

class FeatchNewestBooksUseCase extends UseCase<List<EntityBook>, NoParam> {
  final HomeRepo homeRepo;

  FeatchNewestBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<EntityBook>>> call([NoParam? param]) {
    return homeRepo.fetchNewestBooks();
  }
}
