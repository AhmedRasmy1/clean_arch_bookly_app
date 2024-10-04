import 'package:bookly/Features/home/domian/entities/entity_book.dart';

abstract class HomeRepo {
  Future<List<EntityBook>> fetchFeaturedBooks();
  Future<List<EntityBook>> fetchNewestBooks();
}
