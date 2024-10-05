import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/domian/entities/entity_book.dart';
import 'package:bookly/core/utils/api_service.dart';

abstract class HomeRemoteDataSource {
  Future<List<EntityBook>> fetchFeaturedBooks();

  Future<List<EntityBook>> fetchNewestBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<EntityBook>> fetchFeaturedBooks() async {
    var data = await apiService.get(
        endpoint: 'volumes?q=programming&Filtering=free-ebooks');

    List<EntityBook> books = getBooksList(data);
    return books;
  }

  @override
  Future<List<EntityBook>> fetchNewestBooks() async {
    var data = await apiService.get(
        endpoint: 'volumes?q=programming&Filtering=free-ebooks&Sorting=newest');

    List<EntityBook> books = getBooksList(data);
    return books;
  }
  //====================================================//

  List<EntityBook> getBooksList(Map<String, dynamic> data) {
    List<EntityBook> books = [];
    for (var bookMap in data['items']) {
      books.add(BookModel.fromJson(bookMap));
    }
    return books;
  }
}
