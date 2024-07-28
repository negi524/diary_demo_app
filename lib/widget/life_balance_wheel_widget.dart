import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary_demo_app/domain/life_balance_wheel.dart';
import 'package:diary_demo_app/locator.dart';
import 'package:diary_demo_app/state/life_balance_wheel_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';
import 'package:provider/provider.dart';

/// ライフバランスホイールのページ
class LifeBalanceWheelWidget extends StatelessWidget {
  final FirebaseFirestore _db = locator<FirebaseFirestore>();

  @override
  Widget build(BuildContext context) {
    var lifeBalanceWheelState = context.watch<LifeBalanceWheelState>();
    var inputLifeBalanceWheel =
        lifeBalanceWheelState.getLifeBalanceWheel().copy();

    return Form(
      child: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text('ライフバランスホイール',
                style: Theme.of(context).textTheme.headlineLarge),
          ),
          ElevatedButton(
              onPressed: () {
                // TODO: 処理削除
                _db.collection('users').get().then((event) {
                  for (var doc in event.docs) {
                    print("${doc.id} => ${doc.data()}");
                  }
                });
              },
              child: Text('テスト用ボタン')),
          SizedBox(height: 20),
          buildRadarChart(inputLifeBalanceWheel),
          SizedBox(height: 20),
          buildTable(inputLifeBalanceWheel),
          SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                lifeBalanceWheelState
                    .setLifeBalanceWheel(inputLifeBalanceWheel);
                // 保存したことを通知
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('保存しました'),
                  duration: Duration(seconds: 1),
                ));
              },
              child: Text('保存'))
        ]),
      ),
    );
  }
}

Widget buildRadarChart(LifeBalanceWheel lifeBalanceWheel) {
  final scores = [
    lifeBalanceWheel.workSatisfaction.getScore().toDouble(),
    lifeBalanceWheel.relationships.getScore().toDouble(),
    lifeBalanceWheel.family.getScore().toDouble(),
    lifeBalanceWheel.lovePartnership.getScore().toDouble(),
    lifeBalanceWheel.fitnessHealth.getScore().toDouble(),
    lifeBalanceWheel.hobbiesEntertainment.getScore().toDouble(),
    lifeBalanceWheel.money.getScore().toDouble(),
    lifeBalanceWheel.livingEnvironment.getScore().toDouble(),
  ];

  return Center(
    child: SizedBox(
      height: 300,
      width: 300,
      child: RadarChart(
        ticks: [2, 4, 6, 8, 10],
        features: [
          lifeBalanceWheel.workSatisfaction.getName(),
          lifeBalanceWheel.relationships.getName(),
          lifeBalanceWheel.family.getName(),
          lifeBalanceWheel.lovePartnership.getName(),
          lifeBalanceWheel.fitnessHealth.getName(),
          lifeBalanceWheel.hobbiesEntertainment.getName(),
          lifeBalanceWheel.money.getName(),
          lifeBalanceWheel.livingEnvironment.getName(),
        ],
        data: [scores],
        reverseAxis: false,
      ),
    ),
  );
}

Widget buildTable(LifeBalanceWheel lifeBalanceWheel) {
  return Table(
    border: TableBorder.all(),
    columnWidths: {
      0: FixedColumnWidth(300),
      1: FixedColumnWidth(100),
    },
    children: [
      buildTableRow(lifeBalanceWheel.workSatisfaction),
      buildTableRow(lifeBalanceWheel.relationships),
      buildTableRow(lifeBalanceWheel.family),
      buildTableRow(lifeBalanceWheel.lovePartnership),
      buildTableRow(lifeBalanceWheel.fitnessHealth),
      buildTableRow(lifeBalanceWheel.hobbiesEntertainment),
      buildTableRow(lifeBalanceWheel.money),
      buildTableRow(lifeBalanceWheel.livingEnvironment),
    ],
  );
}

TableRow buildTableRow(LifeBalanceAsset asset) {
  return TableRow(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(asset.getName()),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          initialValue: asset.getScore().toString(),
          keyboardType: TextInputType.number,
          onChanged: (value) {
            asset.setScore(int.tryParse(value) ?? 0);
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
      )
    ],
  );
}
