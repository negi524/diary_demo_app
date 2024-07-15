/// ライフバランスホイール
class LifeBalanceWheel {
  /// ライフバランスホイールの要素リスト
  final List<LifeBalanceAsset> lifeBalanceList;

  LifeBalanceWheel()
      : lifeBalanceList = [
          LifeBalanceAsset(name: '仕事の充実度', score: 0),
          LifeBalanceAsset(name: '人間関係(仕事、友人)', score: 0),
          LifeBalanceAsset(name: '家族', score: 0),
          LifeBalanceAsset(name: '恋愛・パートナーシップ', score: 0),
          LifeBalanceAsset(name: '運動・フィットネス・健康', score: 0),
          LifeBalanceAsset(name: '趣味・娯楽', score: 0),
          LifeBalanceAsset(name: 'お金・経済状況', score: 0),
          LifeBalanceAsset(name: '住環境', score: 0),
        ];

  /// スコアを一括で設定する
  void setScores(List<int> scores) {
    if (scores.length != lifeBalanceList.length) {
      throw ArgumentError(
          'Scores list length must match life balance list length');
    }
    for (int i = 0; i < lifeBalanceList.length; i++) {
      lifeBalanceList[i].score = scores[i];
    }
  }
}

/// ライフバランスホイールの1要素
class LifeBalanceAsset {
  /// 項目名
  final String name;

  /// 項目名の点数
  int score;

  LifeBalanceAsset({
    required this.name,
    required this.score,
  });
}
