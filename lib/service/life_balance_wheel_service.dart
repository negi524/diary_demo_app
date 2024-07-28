import 'package:diary_demo_app/domain/life_balance_wheel.dart';
import 'package:diary_demo_app/infrastructure/firebase_repository.dart';
import 'package:diary_demo_app/locator.dart';

/// ライフバランスホイールのサービス
class LifeBalanceWheelService {
  final FirebaseRepository _firebaseRepository = locator<FirebaseRepository>();

  /// ライフバランスホイールのデータを取得する
  Future<LifeBalanceWheel> fetchLifeBalanceWheeel() async {
    // TODO: 日付を引数に取る
    var temp = await _firebaseRepository.getLifeBalanceWheelAssettes();
    return LifeBalanceWheel.fromLifeBalanceWheelDto(temp);
  }
}
