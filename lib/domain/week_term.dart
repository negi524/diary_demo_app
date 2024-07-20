import 'package:intl/intl.dart';

/// 曜日の基準
class WeekTerm {
  /// 開始日
  final DateTime _startDate;

  /// 終了日
  final DateTime _endDate;

  /// 日付のフォーマット
  final DateFormat _dateFormat = DateFormat('yyyy/MM/dd');

  /// プライベートコンストラクタ
  WeekTerm._(DateTime startDate, DateTime endDate)
      : _startDate = startDate,
        _endDate = endDate;

  /// ファクトリメソッド
  factory WeekTerm.create(DateTime baseDate) {
    // 月曜日を開始日とする
    int startDateDifference = baseDate.weekday - DateTime.monday;
    final startDate = baseDate.subtract(Duration(days: startDateDifference));

    int endDateDifference = DateTime.sunday - baseDate.weekday;
    final endDate = baseDate.add(Duration(days: endDateDifference));
    return WeekTerm._(startDate, endDate);
  }

  /// 今週の開始日を文字列で取得する
  String getStartDateString() {
    return _dateFormat.format(_startDate);
  }

  /// 今週末の日付を文字列で取得する
  String getEndDateString() {
    return _dateFormat.format(_endDate);
  }

  /// 今週一週間の範囲を文字列で取得する
  String getWeekString() {
    return '${getStartDateString()} 〜 ${getEndDateString()}';
  }
}
