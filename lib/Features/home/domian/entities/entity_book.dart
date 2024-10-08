import 'package:hive/hive.dart';
part 'entity_book.g.dart';

@HiveType(typeId: 0)
class EntityBook {
  @HiveField(0)
  final String? bookId;
  @HiveField(1)
  final String? image;
  @HiveField(2)
  final String? title;
  @HiveField(3)
  final String? author;
  @HiveField(4)
  final num? rating;
  @HiveField(5)
  final num? price;
  @HiveField(6)
  final num? averageCount;

  EntityBook({
    required this.bookId,
    required this.image,
    required this.title,
    required this.author,
    required this.rating,
    required this.price,
    required this.averageCount,
  });
}
