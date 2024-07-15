/// 週の目標
class WeekGoal {
  /// 理想の状態
  final String idealState;

  /// 理想の状態になるためにやるべきこと
  final List<String> todoList;

  /// 備考
  final String? remarks;

  WeekGoal({required this.idealState, required this.todoList, this.remarks});
}
