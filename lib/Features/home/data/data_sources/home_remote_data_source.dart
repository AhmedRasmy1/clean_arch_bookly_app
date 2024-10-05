import 'package:bookly/Features/home/domian/entities/entity_book.dart';

abstract class HomeRemoteDataSource {
  Future<List<EntityBook>> fetchFeaturedBooks();

  Future<List<EntityBook>> fetchNewestBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  @override
  Future<List<EntityBook>> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }

  @override
  Future<List<EntityBook>> fetchNewestBooks() {
    // TODO: implement fetchNewestBooks
    throw UnimplementedError();
  }
}
