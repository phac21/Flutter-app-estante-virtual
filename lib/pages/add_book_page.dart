import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/book.dart';
import '../models/book_model.dart';
import '../services/book_service.dart';

class AddBookPage extends StatefulWidget {
  const AddBookPage({super.key});

  @override
  _AddBookPageState createState() => _AddBookPageState();
}

class _AddBookPageState extends State<AddBookPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Book> _searchResults = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Pesquisar Livro',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _searchBooks,
              child: const Text('Pesquisar'),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: _buildSearchResults(),
            ),
          ],
        ),
      ),
    );
  }

  void _addBookToLibrary(Book book) async {
    final bookModel = Provider.of<BookModel>(context, listen: false);
    bookModel.addBook(book);

    // Limpar os dados de pesquisa
    setState(() {
      _searchResults = [];
    });

    // Atualizar a lista de resultados de pesquisa
    _searchBooks();

    // Mostrar mensagem de sucesso
    _showSuccessMessage();
  }

  Widget _buildSearchResults() {
    return ListView.builder(
      itemCount: _searchResults.length,
      itemBuilder: (context, index) {
        Book book = _searchResults[index];
        return Card(
          elevation: 2.0,
          margin: const EdgeInsets.only(bottom: 16.0),
          child: ListTile(
            title: Text(book.title),
            subtitle: Text('Autor: ${book.author} Data: ${book.publishedDate}'),
            // publishedDate: Text('Data: ${book.publishedDate}'),
            trailing: IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => _addBookToLibrary(book),
            ),
          ),
        );
      },
    );
  }

  void _searchBooks() async {
    String query = _searchController.text;
    if (query.isNotEmpty) {
      List<Book> results = await BookService.searchBooks(query);
      setState(() {
        _searchResults = results;
      });

      // Limpar os dados de pesquisa após a conclusão da pesquisa
      _searchController.clear();
    }
  }

  void _showSuccessMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Livro adicionado com sucesso!'),
      ),
    );
  }
}
