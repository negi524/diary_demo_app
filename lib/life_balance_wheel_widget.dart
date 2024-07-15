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

    var lifeBalanceWheelList = appState
        .getLifeBalanceWheel()
        .getElementList()
        .map((element) =>
            ListTile(title: Text('${element.name}=${element.score}')))
        .toList();

    return ListView(children: [
      Padding(
        padding: const EdgeInsets.all(20),
        child: Text('ライフバランスホイール'),
      ),
      ...lifeBalanceWheelList,
    ]);
  }
}
