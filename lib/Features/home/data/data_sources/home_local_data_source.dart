import '../../domian/entities/entity_book.dart';
import '../../../../constants.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  List<EntityBook> fetchFeaturedBooks({int pageNumber = 0});
  List<EntityBook> fetchNewestBooks();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<EntityBook> fetchFeaturedBooks({int pageNumber = 0}) {
    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber + 1) * 10;

    var box = Hive.box<EntityBook>(kFeauturedBooks);
    int length = box.values.length;
    if (startIndex >= length || endIndex > length) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<EntityBook> fetchNewestBooks() {
    var box = Hive.box<EntityBook>(kNewestBooks);
    return box.values.toList();
  }
}
