import 'package:diary_demo_app/domain/week_goal.dart';
import 'package:diary_demo_app/domain/week_review.dart';
import 'package:flutter/material.dart';

/// 週のページ
class WeekPage extends StatefulWidget {
  @override
  State<WeekPage> createState() => _WeekPageState();
}

class _WeekPageState extends State<WeekPage> {
  WeekGoal weekGoal =
      WeekGoal(idealState: '理想の状態', todoList: ['やること1', 'やること2']);

  WeekReview weekReview = WeekReview(reviewText: 'レビュー内容');

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Padding(
        padding: const EdgeInsets.all(20),
        child: Text(weekGoal.idealState),
      ),
      ...weekGoal.todoList.map((e) => Text(e)),
    ]);
    // throw UnimplementedError();
  }
}
