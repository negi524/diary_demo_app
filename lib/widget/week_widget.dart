import 'package:diary_demo_app/main.dart';
import 'package:diary_demo_app/page/review_edit_page.dart';
import 'package:diary_demo_app/page/week_goal_edit_page.dart';
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

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('目標', style: Theme.of(context).textTheme.headlineLarge),
              SizedBox(width: 30),
              ElevatedButton(
                  onPressed: () {
                    // ボタンが押されたときの処理
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WeekGoalEditPage()));
                  },
                  child: Text('目標編集')),
            ],
          ),
          SizedBox(height: 30),
          Text(appState.getIdealState()),
          Text(appState.getTodoListText()),
          SizedBox(height: 60),
          Row(children: [
            Text('振り返り', style: Theme.of(context).textTheme.headlineLarge),
            SizedBox(width: 30),
            ElevatedButton(
                onPressed: () {
                  // ボタンが押されたときの処理
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ReviewEditPage()));
                },
                child: Text('振り返り編集')),
          ]),
          SizedBox(height: 30),
          Text(appState.getWeekReviewText()),
        ],
      ),
    );
  }
}
