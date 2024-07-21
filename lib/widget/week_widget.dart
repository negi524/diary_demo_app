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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  color: Colors.blue,
                  disabledColor: Colors.grey,
                  onPressed: !weekState.hasPreviousWeek()
                      ? null
                      : () => weekState.updatePreviousWeek(),
                  icon: Icon(Icons.navigate_before)),
              Text(weekState.getWeekTermText(),
                  style: Theme.of(context).textTheme.headlineLarge),
              IconButton(
                  color: Colors.blue,
                  disabledColor: Colors.grey,
                  onPressed: !weekState.hasNextWeek()
                      ? null
                      : () => weekState.updateNextWeek(),
                  icon: Icon(Icons.navigate_next)),
            ],
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
