class Book {
  Book({
    this.rating,
    this.title,
    this.author,
    this.coverArt,
    this.month,
    this.category,
    this.books,
  });

  final String author;
  final String coverArt;
  final String month;
  final int rating;
  final String title;
  final List<String> category;
  final List<Book> books;
}
