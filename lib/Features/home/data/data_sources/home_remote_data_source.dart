import '../models/book_model/book_model.dart';
import '../../domian/entities/entity_book.dart';
import '../../../../constants.dart';
import '../../../../core/utils/api_service.dart';
import '../../../../core/utils/functions/save_data.dart';

abstract class HomeRemoteDataSource {
  Future<List<EntityBook>> fetchFeaturedBooks({int pageNumber = 0});

  Future<List<EntityBook>> fetchNewestBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<EntityBook>> fetchFeaturedBooks({int pageNumber = 0}) async {
    var data = await apiService.get(
        endpoint:
            'volumes?q=programming&Filtering=free-ebooks&startIndex=${pageNumber * 10}');

    List<EntityBook> books = getBooksList(data);

    saveBoxData(books, kFeauturedBooks);
    return books;
  }

  @override
  Future<List<EntityBook>> fetchNewestBooks() async {
    var data = await apiService.get(
        endpoint: 'volumes?q=programming&Filtering=free-ebooks&Sorting=newest');

    List<EntityBook> books = getBooksList(data);
    saveBoxData(books, kNewestBooks);
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
