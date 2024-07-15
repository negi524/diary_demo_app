import 'package:flutter/material.dart';

/// ライフバランスホイールのページ
class LifeBalanceWheelWidget extends StatefulWidget {
  @override
  State<LifeBalanceWheelWidget> createState() => _LifeBalanceWheelWidgetState();
}

class _LifeBalanceWheelWidgetState extends State<LifeBalanceWheelWidget> {
  List<ListTile> data = [
    ListTile(title: Text('仕事の充実度')),
    ListTile(title: Text('人間関係(仕事、友人)')),
    ListTile(title: Text('家族')),
    ListTile(title: Text('恋愛・パートナーシップ')),
    ListTile(title: Text('運動・フィットネス・健康')),
    ListTile(title: Text('趣味・娯楽')),
    ListTile(title: Text('お金・経済状況')),
    ListTile(title: Text('住環境')),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Padding(
        padding: const EdgeInsets.all(20),
        child: Text('ライフバランスホイール'),
      ),
      ...data,
    ]);
    // throw UnimplementedError();
  }
}
