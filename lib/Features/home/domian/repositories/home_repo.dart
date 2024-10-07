import '../entities/entity_book.dart';
import '../../../../core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<EntityBook>>> fetchFeaturedBooks();
  Future<Either<Failure, List<EntityBook>>> fetchNewestBooks();
}
