import 'package:intl/intl.dart';

/// 曜日の基準
class WeekTerm {
  /// 今日の日付
  final DateTime _today;

  /// 日付のフォーマット
  final DateFormat _dateFormat = DateFormat('yyyy/MM/dd');

  WeekTerm() : _today = DateTime.now();

  /// 今日の日時を取得する
  DateTime getToday() {
    return _today;
  }

  /// 月曜日を取得する
  DateTime _getMondayOfWeek() {
    int difference = _today.weekday - DateTime.monday;
    return _today.subtract(Duration(days: difference));
  }

  /// 今週の開始日を文字列で取得する
  String getStartDateString() {
    return _dateFormat.format(_getMondayOfWeek());
  }

  /// 今週末の日曜日を取得する
  DateTime _getSundayOfWeek() {
    int difference = DateTime.sunday - _today.weekday;
    return _today.add(Duration(days: difference));
  }

  /// 今週末の日付を文字列で取得する
  String getEndDateString() {
    return _dateFormat.format(_getSundayOfWeek());
  }

  /// 今週一週間の範囲を文字列で取得する
  String getWeekString() {
    return '${getStartDateString()} 〜 ${getEndDateString()}';
  }
}
