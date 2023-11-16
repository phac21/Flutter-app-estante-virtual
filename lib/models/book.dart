class Book {
  final String title;
  final String author;
  final String description;
  final ImageLinks imageLinks;
  final String publishedDate;

  Book({
    required this.title,
    required this.author,
    required this.description,
    required this.imageLinks,
    required this.publishedDate,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      title: json['volumeInfo']['title'],
      author: json['volumeInfo']['authors']?.join(', ') ?? 'Unknown Author',
      description:
          json['volumeInfo']['description'] ?? 'No description available',
      publishedDate:
          json['volumeInfo']['publishedDate'] ?? 'No published date available',
      imageLinks: ImageLinks.fromJson(json['volumeInfo']['imageLinks'] ?? {}),
    );
  }
}

class ImageLinks {
  final String? smallThumbnail;
  final String? thumbnail;

  ImageLinks({this.smallThumbnail, this.thumbnail});

  factory ImageLinks.fromJson(Map<String, dynamic> json) {
    return ImageLinks(
      smallThumbnail: json['smallThumbnail'],
      thumbnail: json['thumbnail'],
    );
  }
}
