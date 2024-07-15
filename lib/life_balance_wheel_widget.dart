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
      Text('${lifeBalanceWheel.family.getName()}='),
    ]);
  }
}
