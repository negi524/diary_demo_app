import 'package:diary_demo_app/domain/life_balance_wheel.dart';
import 'package:flutter/material.dart';

class LifeBalanceWheelState extends ChangeNotifier {
  /// 表示対象のライフバランスホイールデータ
  late LifeBalanceWheel _lifeBalanceWheel;

  /// コンストラクタ
  LifeBalanceWheelState() {
    _init();
  }

  /// 初期化処理
  void _init() {
    // TODO: データフェッチを行う
    _lifeBalanceWheel = LifeBalanceWheel();
  }

  /// ライフバランスホイールのデータを取得する
  LifeBalanceWheel getLifeBalanceWheel() {
    return _lifeBalanceWheel;
  }

  /// ライフバランスホイールのデータを更新する
  void setLifeBalanceWheel(LifeBalanceWheel newLifeBalanceWheel) {
    // TODO: 裏側のデータも更新する
    _lifeBalanceWheel = newLifeBalanceWheel;
    notifyListeners();
  }
}
