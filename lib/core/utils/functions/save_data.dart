import '../../../Features/home/domian/entities/entity_book.dart';
import 'package:hive/hive.dart';

void saveBoxData(List<EntityBook> books, String boxName) {
  var box = Hive.box(boxName);
  box.addAll(books);
}
