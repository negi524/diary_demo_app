import 'package:diary_demo_app/domain/week_goal.dart';
import 'package:diary_demo_app/domain/week_review.dart';
import 'package:diary_demo_app/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// 週のページ
class WeekPage extends StatefulWidget {
  @override
  State<WeekPage> createState() => _WeekPageState();
}

class _WeekPageState extends State<WeekPage> {
  late DateTime startDayOfWeek;

  // initStateを使って非同期初期化を行う
  @override
  void initState() {
    super.initState();
    startDayOfWeek = DateTime.now()
        .subtract(Duration(days: DateTime.now().weekday - DateTime.monday));
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    // WeekGoal weekGoal = WeekGoal(
    //     startDate: startDayOfWeek,
    //     idealState: '理想の状態',
    //     todoList: ['やること1', 'やること2']);

    return Center(child: Text(appState.weekReview.reviewText));
  }
}
