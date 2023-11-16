import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/book.dart';

class BookService {
  static const String apiUrl = "https://www.googleapis.com/books/v1/volumes?q=";

  static Future<List<Book>> searchBooks(String query) async {
    final response = await http.get(Uri.parse(apiUrl + query));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> items = data['items'];
      return items.map((e) => Book.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load books');
    }
  }
}
