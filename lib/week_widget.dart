import 'package:diary_demo_app/main.dart';
import 'package:diary_demo_app/review_edit_page.dart';
import 'package:diary_demo_app/week_goal_edit_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// 週のページ
class WeekWidget extends StatefulWidget {
  @override
  State<WeekWidget> createState() => _WeekWidgetState();
}

class _WeekWidgetState extends State<WeekWidget> {
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

    return Center(
        child: Column(
      children: [
        Text('目標'),
        Text(appState.getIdealState()),
        Text(appState.getTodoListText()),
        ElevatedButton(
            onPressed: () {
              // ボタンが押されたときの処理
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WeekGoalEditPage()));
            },
            child: Text('目標修正')),
        SizedBox(height: 60),
        Text('振り返り'),
        Text(appState.getWeekReviewText()),
        ElevatedButton(
            onPressed: () {
              // ボタンが押されたときの処理
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ReviewEditPage()));
            },
            child: Text('振り返り編集')),
      ],
    ));
  }
}
