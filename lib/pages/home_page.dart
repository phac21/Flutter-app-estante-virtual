import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/book.dart';
import '../models/book_model.dart';
import '../widgets/book_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final currentTime = DateTime.now();
    final hour = currentTime.hour;

    String greeting;

    if (hour < 12) {
      greeting = 'Olá, bom dia!';
    } else if (hour < 18) {
      greeting = 'Olá, boa tarde!';
    } else {
      greeting = 'Olá, Boa noite!';
    }

    return Scaffold(
      body: Consumer<BookModel>(
        builder: (context, bookModel, child) {
          final List<Book> books = bookModel.library;
          final lastBook = books.isNotEmpty ? books.last : null;

          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  greeting,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Livro atual:',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal),
                ),
                const SizedBox(height: 16),
                if (lastBook != null) BookCard(book: lastBook),
                if (lastBook == null) const Text('Nenhum livro adicionado.'),
              ],
            ),
          );
        },
      ),
    );
  }
}
