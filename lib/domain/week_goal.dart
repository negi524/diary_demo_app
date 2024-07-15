import 'package:intl/intl.dart';

/// 週の目標
class WeekGoal {
  /// 週の開始日
  final DateTime startDate;

  /// 理想の状態
  String? idealState;

  /// 理想の状態になるためにやるべきこと
  // final List<String> todoList;
  String? todoListText;

  /// 備考
  final String? remarks;

  WeekGoal(
      {required this.startDate,
      this.idealState,
      this.todoListText,
      this.remarks});

  /// 1週間の日付を文字列で取得する
  String get1WeekString() {
    final start = DateFormat('yyyy/MM/dd').format(startDate);
    final end =
        DateFormat('yyyy/MM/dd').format(startDate.add(Duration(days: 7)));
    return '$start 〜 $end';
  }

  /// 理想の状態の文字列を取得する
  String getIdealStateText() {
    return idealState ?? '';
  }

  /// 理想の状態の文字列を更新する
  void setIdealState(String text) {
    idealState = text;
  }

  /// やることリストの文字列を取得する
  String getTodoListText() {
    return todoListText ?? '';
  }

  /// やることリストを更新する
  void setTodoListText(String text) {
    todoListText = text;
  }
}
