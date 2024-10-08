import '../data_sources/home_local_data_source.dart';
import '../data_sources/home_remote_data_source.dart';
import '../../domian/entities/entity_book.dart';
import '../../domian/repositories/home_repo.dart';
import '../../../../core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl(
      {required this.homeRemoteDataSource, required this.homeLocalDataSource});
  @override
  Future<Either<Failure, List<EntityBook>>> fetchFeaturedBooks(
      {int pageNumber = 0}) async {
    try {
      var bookList =
          homeLocalDataSource.fetchFeaturedBooks(pageNumber: pageNumber);

      if (bookList.isEmpty) {
        var books = await homeRemoteDataSource.fetchFeaturedBooks(
            pageNumber: pageNumber);
        return right(books);
      } else {
        return right(bookList);
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<EntityBook>>> fetchNewestBooks() async {
    try {
      var bookList = homeLocalDataSource.fetchNewestBooks();

      if (bookList.isEmpty) {
        var books = await homeRemoteDataSource.fetchNewestBooks();
        return right(books);
      } else {
        return right(bookList);
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
