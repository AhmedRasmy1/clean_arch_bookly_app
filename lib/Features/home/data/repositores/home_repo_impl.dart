import 'package:bookly/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly/Features/home/domian/entities/entity_book.dart';
import 'package:bookly/Features/home/domian/repositories/home_repo.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl(
      {required this.homeRemoteDataSource, required this.homeLocalDataSource});
  @override
  Future<Either<Failure, List<EntityBook>>> fetchFeaturedBooks() async {
    try {
      var bookList = homeLocalDataSource.fetchFeaturedBooks();
      var books = await homeRemoteDataSource.fetchFeaturedBooks();
      if (bookList.isEmpty) {
        return right(books);
      } else {
        return right(bookList);
      }
    } catch (e) {
      return left(Failure());
    }
  }

  @override
  Future<Either<Failure, List<EntityBook>>> fetchNewestBooks() {
    // TODO: implement fetchNewestBooks
    throw UnimplementedError();
  }
}
