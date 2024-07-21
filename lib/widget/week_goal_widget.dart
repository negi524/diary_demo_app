import 'package:diary_demo_app/domain/week_goal.dart';
import 'package:diary_demo_app/page/week_goal_edit_page.dart';
import 'package:flutter/material.dart';

/// 週の目標ウィジェット
class WeekGoalWidget extends StatelessWidget {
  /// 週の目標
  final WeekGoal weekGoal;

  const WeekGoalWidget({super.key, required this.weekGoal});
  @override
  Widget build(BuildContext context) {
    return Column(
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
        Text(weekGoal.getIdealStateText()),
        Text(weekGoal.getTodoListText()),
      ],
    );
  }
}
