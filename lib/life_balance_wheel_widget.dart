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
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var lifeBalanceWheel = appState.getLifeBalanceWheel();

    return ListView(children: [
      Padding(
        padding: const EdgeInsets.all(20),
        child: Text('ライフバランスホイール'),
      ),
      buildTable(lifeBalanceWheel),
    ]);
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
          initialValue: '0',
          keyboardType: TextInputType.number,
          onChanged: (value) {
            // TODO: 保存処理実装
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
      )
    ],
  );
}
