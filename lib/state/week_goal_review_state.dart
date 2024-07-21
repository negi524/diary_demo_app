import 'package:diary_demo_app/domain/weekly_goal_review.dart';
import 'package:diary_demo_app/locator.dart';
import 'package:diary_demo_app/service/weekly_goal_review_factory.dart';
import 'package:flutter/material.dart';

/// 週の目標と振り返りを行うステート
class WeekGoalReviewState extends ChangeNotifier {
  final WeeklyGoalReviewFactory _weeklyGoalReviewFactory =
      locator<WeeklyGoalReviewFactory>();
  late WeeklyGoalReview _weeklyGoalReview;

  /// コンストラクタ
  WeekGoalReviewState() {
    _init();
  }

  /// 初期化処理
  void _init() {
    // 初期データ取得
    // TODO: データフェッチを行う
    _weeklyGoalReview = _weeklyGoalReviewFactory.createMock()[1];
  }

  /// 理想の状態を取得する
  String getIdealState() {
    return _weeklyGoalReview.getWeekGoal().getIdealStateText();
  }

  /// やることリストを取得する
  String getTodoListText() {
    return _weeklyGoalReview.getWeekGoal().getTodoListText();
  }

  /// 振り返りの内容を取得する
  String getWeekReviewText() {
    return _weeklyGoalReview.getWeekReview().getReviewText();
  }

  /// 理想の状態を更新する
  void setIdealState(String idealState) {
    // TODO: 外部データの更新
    _weeklyGoalReview.getWeekGoal().setIdealState(idealState);
    notifyListeners();
  }

  /// やることリストを更新する
  void setTodoListText(String thingsTodo) {
    // TODO: 外部データの更新
    _weeklyGoalReview.getWeekGoal().setTodoListText(thingsTodo);
    notifyListeners();
  }

  /// 振り返りの内容を更新する
  void setReview(String reviewText) {
    // TODO: 外部データの更新
    _weeklyGoalReview.getWeekReview().setReviewText(reviewText);
    notifyListeners();
  }

  void setNextWeek() {
    // TODO: データフェッチを行い、次週のデータで更新する
  }

  void setPreviousWeek() {
    // TODO: データフェッチを行い、先週のデータで更新する
  }
}
