import 'package:diary_demo_app/domain/life_balance_wheel.dart';
import 'package:diary_demo_app/domain/week_goal.dart';
import 'package:diary_demo_app/domain/week_review.dart';
import 'package:diary_demo_app/domain/weekly_goal_review.dart';
import 'package:diary_demo_app/service/weekly_goal_review_factory.dart';
import 'package:diary_demo_app/widget/week_widget.dart';
import 'package:diary_demo_app/widget/life_balance_wheel_widget.dart';
import 'package:diary_demo_app/widget/profile_widget.dart';
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
        title: 'Diary App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: HomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  /// ライフバランスホイール
  LifeBalanceWheel _lifeBalanceWheel = LifeBalanceWheel();

  /// TODO: 現在位置を保持する
  int currentIndex = 0;

  /// 週の目標と振り返り
  List<WeeklyGoalReview> _weeklyGoalReviewList =
      WeeklyGoalReviewFactory.createMock();

  /// 週の目標
  WeekGoal _weekGoal =
      WeekGoal.create(idealState: '理想の状態', todoListText: 'todoListText');

  /// 週の振り返り
  // WeekReview _weekReview = WeekReview.create();
  WeekReview _weekReview = WeekReview.create();

  /// ライフバランスホイールのデータを取得する
  LifeBalanceWheel getLifeBalanceWheel() {
    return _lifeBalanceWheel;
  }

  /// ライフバランスホイールのデータを更新する
  void setLifeBalanceWheel(LifeBalanceWheel updateData) {
    _lifeBalanceWheel = updateData.copy();
    notifyListeners();
  }

  /// 理想の状態を取得する
  String getIdealState() {
    return _weekGoal.getIdealStateText();
  }

  /// 理想の状態を更新する
  void setIdealState(String idealState) {
    _weekGoal.setIdealState(idealState);
    notifyListeners();
  }

  /// やることリストを取得する
  String getTodoListText() {
    return _weekGoal.getTodoListText();
  }

  /// やることリストを更新する
  void setTodoListText(String thingsTodo) {
    _weekGoal.setTodoListText(thingsTodo);
    notifyListeners();
  }

  /// 振り返りの内容を取得する
  String getWeekReviewText() {
    return _weekReview.reviewText ?? '';
  }

  /// 振り返りの内容を更新する
  void setReviewText(String text) {
    _weekReview.setReviewText(text);
    notifyListeners();
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ページ遷移
    Widget page;
    switch (_selectedIndex) {
      case 0:
        page = LifeBalanceWheelWidget();
        break;
      case 1:
        page = WeekWidget();
        break;
      case 2:
        page = ProfileWidget();
        break;
      default:
        throw UnimplementedError('no widget for $_selectedIndex');
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('日記サンプルアプリ'),
        backgroundColor: Colors.blue[200],
      ),
      body: page,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.pie_chart), label: 'Life Balance Wheel'),
          BottomNavigationBarItem(
              icon: Icon(Icons.view_week_outlined), label: 'Week'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
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
