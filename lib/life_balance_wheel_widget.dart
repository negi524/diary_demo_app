import 'package:diary_demo_app/domain/life_balance_wheel.dart';
import 'package:diary_demo_app/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// ライフバランスホイールのページ
class LifeBalanceWheelWidget extends StatefulWidget {
  @override
  State<LifeBalanceWheelWidget> createState() => _LifeBalanceWheelWidgetState();
}

class _LifeBalanceWheelWidgetState extends State<LifeBalanceWheelWidget> {
  var inputLifeBalanceWheel = LifeBalanceWheel();

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var masterLifeBalanceWheel = appState.getLifeBalanceWheel();
    inputLifeBalanceWheel = masterLifeBalanceWheel.copy();

    return Form(
      child: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('ライフバランスホイール'),
        ),
        buildTable(inputLifeBalanceWheel),
        ElevatedButton(
            onPressed: () {
              appState.setLifeBalanceWheel(inputLifeBalanceWheel);
              // 保存したことを通知
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('保存しました'),
                duration: Duration(seconds: 1),
              ));
            },
            child: Text('保存'))
      ]),
    );
  }
}

Widget buildTable(LifeBalanceWheel lifeBalanceWheel) {
  return Table(
    border: TableBorder.all(),
    columnWidths: {
      0: FixedColumnWidth(3),
      1: FixedColumnWidth(1),
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
