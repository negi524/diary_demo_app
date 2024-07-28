import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary_demo_app/infrastructure/dto/life_balance_wheel_dto.dart';
import 'package:diary_demo_app/locator.dart';

class FirebaseRepository {
  final FirebaseFirestore _db = locator<FirebaseFirestore>();

  String getGoalReview(DateTime baseDate) {
    return "dummy";
  }

  Future<LifeBalanceWheelDto> getLifeBalanceWheelAssettes() async {
    // TODO: 日付を引数に取る
    var snapshot = await _db
        .collection('4hXLbivJtaTD35uvZanMw1quvIf2')
        .doc('lifeBalanceWheel')
        .collection('2024-07-28')
        .get();
    // print("${snapshot.docs.first.id} => ${snapshot.docs.first.data()}");
    return LifeBalanceWheelDto(
        workSatisfaction: snapshot.docs.first.data()['workSatisfaction']);
  }
}
