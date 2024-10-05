import 'package:bookly/Features/home/domian/entities/entity_book.dart';

abstract class HomeLocalDataSource {
  List<EntityBook> fetchNewestBooks();
  List<EntityBook> fetchFeaturedBooks();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<EntityBook> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }

  @override
  List<EntityBook> fetchNewestBooks() {
    // TODO: implement fetchNewestBooks
    throw UnimplementedError();
  }
}
