import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/book_model.dart';
import 'pages/add_book_page.dart';
import 'pages/all_books_page.dart';
import 'pages/home_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => BookModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const AddBookPage(),
    const AllBooksPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Estante Virtual',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white, // Define a cor de fundo
        appBarTheme: const AppBarTheme(
          backgroundColor:
              Colors.blue, // Define a cor da barra de navegação superior
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.blue, // Define a cor do item selecionado
          unselectedItemColor:
              Colors.grey, // Define a cor do item não selecionado
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Estante Virtual'),
        ),
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Adicionar Livro',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Todos os Livros',
            ),
          ],
        ),
      ),
    );
  }
}
