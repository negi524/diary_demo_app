import 'package:diary_demo_app/domain/week_goal.dart';
import 'package:diary_demo_app/domain/week_review.dart';
import 'package:diary_demo_app/domain/week_term.dart';

/// 一週間の目標と振り返り
class WeeklyGoalReview {
  /// 期間
  final WeekTerm _weekTerm;

  /// 目標
  final WeekGoal _weekGoal;

  /// 振り返り
  final WeekReview _weekReview;

  WeeklyGoalReview._(
      {required WeekTerm weekTerm,
      required WeekGoal weekGoal,
      required WeekReview weekReview})
      : _weekTerm = weekTerm,
        _weekGoal = weekGoal,
        _weekReview = weekReview;

  factory WeeklyGoalReview.create(
      {required WeekTerm weekTerm,
      required WeekGoal weekGoal,
      required WeekReview weekReview}) {
    return WeeklyGoalReview._(
        weekTerm: weekTerm, weekGoal: weekGoal, weekReview: weekReview);
  }

  WeekTerm getWeekTerm() {
    return _weekTerm;
  }

  WeekGoal getWeekGoal() {
    return _weekGoal;
  }

  WeekReview getWeekReview() {
    return _weekReview;
  }

  /// 週の開始と終了を文字列で取得する
  String getWeekTermString() {
    return _weekTerm.getWeekString();
  }
}
