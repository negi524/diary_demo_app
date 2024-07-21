/// 週の振り返り
class WeekReview {
  /// 振り返りのテキスト
  String? reviewText;

  /// プライベートコンストラクタ
  WeekReview._({this.reviewText});

  /// ファクトリメソッド
  factory WeekReview.create([String? reviewText]) {
    return WeekReview._(reviewText: reviewText);
  }

  /// 振り返り内容を更新する
  void setReviewText(String text) {
    reviewText = text;
  }

  /// 振り返りの文字列を取得する
  String getReviewText() {
    return reviewText ?? '';
  }
}
