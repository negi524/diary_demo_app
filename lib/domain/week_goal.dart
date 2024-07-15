import 'package:intl/intl.dart';

/// 週の目標
class WeekGoal {
  /// 週の開始日
  final DateTime startDate;

  /// 理想の状態
  final String idealState;

  /// 理想の状態になるためにやるべきこと
  final List<String> todoList;

  /// 備考
  final String? remarks;

  WeekGoal(
      {required this.startDate,
      required this.idealState,
      required this.todoList,
      this.remarks});

  /// 1週間の日付を文字列で取得する
  String get1WeekString() {
    final start = DateFormat('yyyy/MM/dd').format(startDate);
    final end =
        DateFormat('yyyy/MM/dd').format(startDate.add(Duration(days: 7)));
    return '$start 〜 $end';
  }
}
