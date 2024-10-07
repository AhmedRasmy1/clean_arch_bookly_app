import '../errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type, Param> {
  Future<Either<Failure, Type>> call(
      [Param param]); // Future<Either<Failure , Type>>
}

class NoParam {}
