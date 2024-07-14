import 'package:diary_demo_app/week_page.dart';
import 'package:diary_demo_app/life_balance_wheel.dart';
import 'package:diary_demo_app/setting_page.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

// TODO: 削除
class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: 削除
    // var appState = context.watch<MyAppState>();

    // ページ遷移
    Widget page;
    switch (_selectedIndex) {
      case 0:
        page = LifeBalanceWheel();
        break;
      case 1:
        page = WeekPage();
        break;
      case 2:
        page = SettingPage();
        break;
      default:
        throw UnimplementedError('no widget for $_selectedIndex');
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('ButtonNavigationBar sample'),
      ),
      body: Center(
        child: page,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.pie_chart), label: 'Life Balance Wheel'),
          BottomNavigationBarItem(
              icon: Icon(Icons.view_week_outlined), label: 'Week'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
