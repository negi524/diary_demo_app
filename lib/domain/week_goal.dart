/// 週の目標
class WeekGoal {
  /// 理想の状態
  String? idealState;

  /// 理想の状態になるためにやるべきこと
  // final List<String> todoList;
  String? todoListText;

  /// 備考
  final String? remarks;

  /// プライベートコンストラクタ
  WeekGoal._({this.idealState, this.todoListText, this.remarks});

  /// ファクトリメソッド
  factory WeekGoal.create(
      {String? idealState, String? todoListText, String? remarks}) {
    return WeekGoal._(
        idealState: idealState, todoListText: todoListText, remarks: remarks);
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
