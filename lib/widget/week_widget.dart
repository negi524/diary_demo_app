import 'package:diary_demo_app/state/week_goal_review_state.dart';
import 'package:diary_demo_app/widget/week_goal_widget.dart';
import 'package:diary_demo_app/widget/week_review_widget.dart';
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
          WeekGoalWidget(weekGoal: weekState.getWeekGoal()),
          SizedBox(height: 60),
          WeekReviewWidget(weekReview: weekState.getWeekReview()),
        ],
      ),
    );
  }
}
