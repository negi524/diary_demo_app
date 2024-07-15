import 'package:diary_demo_app/main.dart';
import 'package:diary_demo_app/review_edit_page.dart';
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
    // WeekGoal weekGoal = WeekGoal(
    //     startDate: startDayOfWeek,
    //     idealState: '理想の状態',
    //     todoList: ['やること1', 'やること2']);

    return Center(
        child: Column(
      children: [
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
