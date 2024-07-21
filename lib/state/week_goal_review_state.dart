import 'package:diary_demo_app/domain/week_goal.dart';
import 'package:diary_demo_app/domain/week_review.dart';
import 'package:diary_demo_app/domain/weekly_goal_review.dart';
import 'package:diary_demo_app/locator.dart';
import 'package:diary_demo_app/service/weekly_goal_review_factory.dart';
import 'package:flutter/material.dart';

/// 週の目標と振り返りを行うステート
class WeekGoalReviewState extends ChangeNotifier {
  final WeeklyGoalReviewFactory _weeklyGoalReviewFactory =
      locator<WeeklyGoalReviewFactory>();

  /// 今見てる週のデータ
  late WeeklyGoalReview _weeklyGoalReview;

  /// ページング
  late int _currentIndex;

  /// コンストラクタ
  WeekGoalReviewState() {
    _init();
  }

  /// 初期化処理
  void _init() {
    // 初期データ取得
    // TODO: データフェッチを行う
    _currentIndex = 1;
    _weeklyGoalReview = _weeklyGoalReviewFactory.createMock()[_currentIndex];
  }

  /// 週の目標データを取得する
  WeekGoal getWeekGoal() {
    return _weeklyGoalReview.getWeekGoal();
  }

  /// 週の振り返りデータを取得する
  WeekReview getWeekReview() {
    return _weeklyGoalReview.getWeekReview();
  }

  /// 週の開始と終了日を文字列で取得する
  String getWeekTermText() {
    return _weeklyGoalReview.getWeekTermString();
  }

  /// 理想の状態を取得する
  @deprecated
  String getIdealState() {
    return _weeklyGoalReview.getWeekGoal().getIdealStateText();
  }

  /// やることリストを取得する
  @deprecated
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

  /// 前の週がある場合はtrueを返す
  bool hasPreviousWeek() {
    return _currentIndex > 0;
  }

  /// 次の週がある場合はtrueを返す
  bool hasNextWeek() {
    return _currentIndex <= 2;
  }

  /// 先週のデータで更新する
  void updatePreviousWeek() {
    // TODO: データフェッチを行い、先週のデータで更新する
    _currentIndex--;
    _weeklyGoalReview = _weeklyGoalReviewFactory.createMock()[_currentIndex];
    notifyListeners();
  }

  /// 次週のデータで更新する
  void updateNextWeek() {
    // TODO: データフェッチを行い、次週のデータで更新する
    _currentIndex++;
    _weeklyGoalReview = _weeklyGoalReviewFactory.createMock()[_currentIndex];
    notifyListeners();
  }
}
