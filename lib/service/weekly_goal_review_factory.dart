import 'package:diary_demo_app/domain/week_goal.dart';
import 'package:diary_demo_app/domain/week_review.dart';
import 'package:diary_demo_app/domain/week_term.dart';
import 'package:diary_demo_app/domain/weekly_goal_review.dart';

/// モックデータの生成クラス
class WeeklyGoalReviewFactory {
  /// モックデータを生成する
  List<WeeklyGoalReview> createMock() {
    var today = DateTime.now();

    final weekTerm1 = WeekTerm.create(today);

    final weekGoal1 =
        WeekGoal.create(idealState: '理想の状態1', todoListText: 'やることリスト1');
    final weekReview1 = WeekReview.create();

    final WeeklyGoalReview weeklyGoalReview1 = WeeklyGoalReview.create(
        weekTerm: weekTerm1, weekGoal: weekGoal1, weekReview: weekReview1);

    /// 7日後
    final weekTerm2 = WeekTerm.create(today.add(Duration(days: 7)));

    final weekGoal2 =
        WeekGoal.create(idealState: '理想の状態2', todoListText: 'やることリスト2');
    final weekReview2 = WeekReview.create();

    final WeeklyGoalReview weeklyGoalReview2 = WeeklyGoalReview.create(
        weekTerm: weekTerm2, weekGoal: weekGoal2, weekReview: weekReview2);

    /// 14日後
    final weekTerm3 = WeekTerm.create(today.add(Duration(days: 14)));

    final weekGoal3 =
        WeekGoal.create(idealState: '理想の状態3', todoListText: 'やることリスト3');
    final weekReview3 = WeekReview.create();

    final WeeklyGoalReview weeklyGoalReview3 = WeeklyGoalReview.create(
        weekTerm: weekTerm3, weekGoal: weekGoal3, weekReview: weekReview3);

    /// 21日後
    final weekTerm4 = WeekTerm.create(today.add(Duration(days: 21)));

    final weekGoal4 =
        WeekGoal.create(idealState: '理想の状態4', todoListText: 'やることリスト4');
    final weekReview4 = WeekReview.create();

    final WeeklyGoalReview weeklyGoalReview4 = WeeklyGoalReview.create(
        weekTerm: weekTerm4, weekGoal: weekGoal4, weekReview: weekReview4);

    return [
      weeklyGoalReview1,
      weeklyGoalReview2,
      weeklyGoalReview3,
      weeklyGoalReview4
    ];
  }
}
