import '../../domian/entities/entity_book.dart';
import '../../../../constants.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  List<EntityBook> fetchNewestBooks();
  List<EntityBook> fetchFeaturedBooks();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<EntityBook> fetchFeaturedBooks() {
    var box = Hive.box<EntityBook>(kFeauturedBooks);
    return box.values.toList();
  }

  @override
  List<EntityBook> fetchNewestBooks() {
    var box = Hive.box<EntityBook>(kNewestBooks);
    return box.values.toList();
  }
}
