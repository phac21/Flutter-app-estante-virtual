import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/book.dart';
import '../models/book_model.dart'; // Importe o modelo de estado global
import '../widgets/book_card.dart';

class AllBooksPage extends StatelessWidget {
  const AllBooksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<BookModel>(
        builder: (context, bookModel, child) {
          final List<Book> allBooks = bookModel.library;

          if (allBooks.isEmpty) {
            return const Center(child: Text('Nenhum livro adicionado.'));
          }

          return ListView.builder(
            itemCount: allBooks.length,
            itemBuilder: (context, index) {
              final Book book = allBooks[index];
              return BookCard(book: book);
            },
          );
        },
      ),
    );
  }
}
