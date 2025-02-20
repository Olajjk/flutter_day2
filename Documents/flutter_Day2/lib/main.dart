import 'package:flutter/material.dart';
import 'package:flutter_day2/home_page.dart';
import 'package:u_credit_card/u_credit_card.dart';
import 'wallets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MoneyApp(),
    );
  }
}

class MoneyApp extends StatefulWidget {
  const MoneyApp({super.key});

  @override
  _MoneyAppState createState() => _MoneyAppState();
}

class _MoneyAppState extends State<MoneyApp> {
  int _selectedIndex = 0;

  // Liste des widgets correspondant aux pages
  final List<Widget> _pages = [
    const HomePage(),
    const Wallets(),
    const TransactionsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
      ),
    );
  }
}





class TransactionsPage extends StatelessWidget {
  const TransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Page Transactions'),
    );
  }
}


