/// 週の振り返り
class WeekReview {
  /// 週の開始日
  final DateTime startDate;

  /// 振り返りのテキスト
  String? reviewText;

  WeekReview({required this.startDate, this.reviewText});

  /// 振り返り内容を更新する
  void setReviewText(String text) {
    reviewText = text;
  }
}
