/// ライフバランスホイール
class LifeBalanceWheel {
  /// 仕事の充実度
  final LifeBalanceAsset workSatisfaction;

  /// 人間関係
  final LifeBalanceAsset relationships;

  /// 家族
  final LifeBalanceAsset family;

  /// 恋愛・パートナーシップ
  final LifeBalanceAsset lovePartnership;

  /// 運動・フィットネス・健康
  final LifeBalanceAsset fitnessHealth;

  /// 趣味・娯楽
  final LifeBalanceAsset hobbiesEntertainment;

  /// お金・経済状況
  final LifeBalanceAsset money;

  /// 住環境
  final LifeBalanceAsset livingEnvironment;

  LifeBalanceWheel()
      : workSatisfaction = LifeBalanceAsset(name: '仕事の充実度', score: 0),
        relationships = LifeBalanceAsset(name: '人間関係(仕事、友人)', score: 0),
        family = LifeBalanceAsset(name: '家族', score: 0),
        lovePartnership = LifeBalanceAsset(name: '恋愛・パートナーシップ', score: 0),
        fitnessHealth = LifeBalanceAsset(name: '運動・フィットネス・健康', score: 0),
        hobbiesEntertainment = LifeBalanceAsset(name: '趣味・娯楽', score: 0),
        money = LifeBalanceAsset(name: 'お金・経済状況', score: 0),
        livingEnvironment = LifeBalanceAsset(name: '住環境', score: 0);

  /// 項目を設定する
  void setScores(List<int> scores) {
    if (scores.length != 8) {
      throw ArgumentError('scores list must contain exactly 8 elements');
    }
    workSatisfaction.setScore(scores[0]);
    relationships.setScore(scores[1]);
    family.setScore(scores[2]);
    lovePartnership.setScore(scores[3]);
    fitnessHealth.setScore(scores[4]);
    hobbiesEntertainment.setScore(scores[5]);
    money.setScore(scores[6]);
    livingEnvironment.setScore(scores[7]);
  }
}

/// ライフバランスホイールの1要素
class LifeBalanceAsset {
  /// 項目名
  final String _name;

  /// 項目名の点数
  int _score;

  /// コンストラクタ
  LifeBalanceAsset({
    required String name,
    int score = 0,
  })  : _name = name,
        _score = score;

  /// 項目名を取得する
  String getName() {
    return _name;
  }

  /// 点数を取得する
  int getScore() {
    return _score;
  }

  /// 新しいスコアを設定する
  void setScore(int newScore) {
    _score = newScore;
  }
}
