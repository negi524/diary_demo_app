import 'package:diary_demo_app/domain/week_goal.dart';
import 'package:diary_demo_app/domain/week_review.dart';
import 'package:flutter/material.dart';

/// 週のページ
class WeekPage extends StatefulWidget {
  @override
  State<WeekPage> createState() => _WeekPageState();
}

class _WeekPageState extends State<WeekPage> {
  DateTime startDayOfWeek = DateTime.now()
      .subtract(Duration(days: DateTime.now().weekday - DateTime.monday));

  @override
  Widget build(BuildContext context) {
    WeekGoal weekGoal = WeekGoal(
        startDate: startDayOfWeek,
        idealState: '理想の状態',
        todoList: ['やること1', 'やること2']);

    WeekReview weekReview =
        WeekReview(startDate: startDayOfWeek, reviewText: 'レビュー内容');

    return ListView(children: [
      Padding(
        padding: const EdgeInsets.all(20),
        child: Text(weekGoal.get1WeekString()),
      ),
      ...weekGoal.todoList.map((e) => Text(e)),
    ]);
    // throw UnimplementedError();
  }
}
