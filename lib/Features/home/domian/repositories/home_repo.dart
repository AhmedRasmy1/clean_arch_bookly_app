import 'package:bookly/Features/home/domian/entities/entity_book.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<EntityBook>>> fetchFeaturedBooks();
  Future<Either<Failure, List<EntityBook>>> fetchNewestBooks();
}
