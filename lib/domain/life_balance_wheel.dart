import 'package:diary_demo_app/infrastructure/dto/life_balance_wheel_dto.dart';

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

  LifeBalanceWheel._({
    required this.workSatisfaction,
    required this.relationships,
    required this.family,
    required this.lovePartnership,
    required this.fitnessHealth,
    required this.hobbiesEntertainment,
    required this.money,
    required this.livingEnvironment,
  });

  /// モックを生成する
  factory LifeBalanceWheel.createMock() {
    return LifeBalanceWheel._(
      workSatisfaction: LifeBalanceAsset(name: '仕事の充実度', score: 5),
      relationships: LifeBalanceAsset(name: '人間関係(仕事、友人)', score: 5),
      family: LifeBalanceAsset(name: '家族', score: 5),
      lovePartnership: LifeBalanceAsset(name: '恋愛・パートナーシップ', score: 5),
      fitnessHealth: LifeBalanceAsset(name: '運動・フィットネス・健康', score: 5),
      hobbiesEntertainment: LifeBalanceAsset(name: '趣味・娯楽', score: 5),
      money: LifeBalanceAsset(name: 'お金・経済状況', score: 5),
      livingEnvironment: LifeBalanceAsset(name: '住環境', score: 5),
    );
  }

  factory LifeBalanceWheel.fromLifeBalanceWheelDto(LifeBalanceWheelDto dto) {
    // TODO: nullセーフにする
    return LifeBalanceWheel._(
      workSatisfaction:
          LifeBalanceAsset(name: '仕事の充実度', score: dto.workSatisfaction ?? 5),
      relationships: LifeBalanceAsset(name: '人間関係(仕事、友人)', score: 5),
      family: LifeBalanceAsset(name: '家族', score: 5),
      lovePartnership: LifeBalanceAsset(name: '恋愛・パートナーシップ', score: 5),
      fitnessHealth: LifeBalanceAsset(name: '運動・フィットネス・健康', score: 5),
      hobbiesEntertainment: LifeBalanceAsset(name: '趣味・娯楽', score: 5),
      money: LifeBalanceAsset(name: 'お金・経済状況', score: 5),
      livingEnvironment: LifeBalanceAsset(name: '住環境', score: 5),
    );
  }

  /// データをコピーして新しいオブジェクトを生成する
  LifeBalanceWheel copy() {
    return LifeBalanceWheel._(
      workSatisfaction:
          LifeBalanceAsset(name: '仕事の充実度', score: workSatisfaction.getScore()),
      relationships: LifeBalanceAsset(
          name: '人間関係(仕事、友人)', score: relationships.getScore()),
      family: LifeBalanceAsset(name: '家族', score: family.getScore()),
      lovePartnership: LifeBalanceAsset(
          name: '恋愛・パートナーシップ', score: lovePartnership.getScore()),
      fitnessHealth: LifeBalanceAsset(
          name: '運動・フィットネス・健康', score: fitnessHealth.getScore()),
      hobbiesEntertainment: LifeBalanceAsset(
          name: '趣味・娯楽', score: hobbiesEntertainment.getScore()),
      money: LifeBalanceAsset(name: 'お金・経済状況', score: money.getScore()),
      livingEnvironment:
          LifeBalanceAsset(name: '住環境', score: livingEnvironment.getScore()),
    );
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
