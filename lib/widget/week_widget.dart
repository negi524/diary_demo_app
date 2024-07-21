import 'package:diary_demo_app/domain/weekly_goal_review.dart';
import 'package:diary_demo_app/locator.dart';
import 'package:diary_demo_app/main.dart';
import 'package:diary_demo_app/page/review_edit_page.dart';
import 'package:diary_demo_app/page/week_goal_edit_page.dart';
import 'package:diary_demo_app/service/weekly_goal_review_factory.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// 週のページ
class WeekWidget extends StatefulWidget {
  @override
  State<WeekWidget> createState() => _WeekWidgetState();
}

class _WeekWidgetState extends State<WeekWidget> {
  final WeeklyGoalReviewFactory _weeklyGoalReviewFactory =
      locator<WeeklyGoalReviewFactory>();
  late WeeklyGoalReview _weeklyGoalReview;

  // 初期化時に目標と振り返り情報を取得する
  @override
  void initState() {
    super.initState();
    // TODO: 例外処理
    _weeklyGoalReview = _weeklyGoalReviewFactory.createMock()[0];
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(_weeklyGoalReview.getWeekTermString(),
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
