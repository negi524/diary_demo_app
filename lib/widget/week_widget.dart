import 'package:diary_demo_app/page/review_edit_page.dart';
import 'package:diary_demo_app/page/week_goal_edit_page.dart';
import 'package:diary_demo_app/state/week_goal_review_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// 週のウィジェット
class WeekWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var weekState = context.watch<WeekGoalReviewState>();

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(weekState.getWeekTermText(),
                style: Theme.of(context).textTheme.headlineLarge),
          ),
          SizedBox(height: 30),
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
          Text(weekState.getIdealState()),
          Text(weekState.getTodoListText()),
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
          Text(weekState.getWeekReviewText()),
        ],
      ),
    );
  }
}
