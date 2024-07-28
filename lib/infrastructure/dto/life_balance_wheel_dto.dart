import 'package:cloud_firestore/cloud_firestore.dart';

class LifeBalanceWheelDto {
  final int? workSatisfaction;

  LifeBalanceWheelDto({this.workSatisfaction});

  factory LifeBalanceWheelDto.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return LifeBalanceWheelDto(workSatisfaction: data?['workSatisfaction']);
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (workSatisfaction != null) "workSatisfaction": workSatisfaction,
    };
  }
}
