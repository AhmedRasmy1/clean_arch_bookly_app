class EntityBook {
  final String? bookId;
  final String? image;
  final String? title;
  final String? author;
  final num? rating;
  final num? price;
  final num? averageCount;

  EntityBook(
      {required this.bookId,
      required this.image,
      required this.title,
      required this.author,
      required this.rating,
      required this.price,
      required this.averageCount});
}
