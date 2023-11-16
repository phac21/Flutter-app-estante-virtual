import 'package:flutter/foundation.dart';

import '../models/book.dart';

class BookModel extends ChangeNotifier {
  final List<Book> _library = [];

  List<Book> get library => _library;

  void addBook(Book book) {
    _library.add(book);
    notifyListeners();
  }
}
