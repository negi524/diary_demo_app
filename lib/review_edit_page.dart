import 'package:diary_demo_app/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReviewEditPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String temp = '';
    var appState = context.watch<MyAppState>();
    return Scaffold(
      appBar: AppBar(
        title: Text('振り返り編集ページ'),
      ),
      body: Column(
        children: [
          TextField(
            controller:
                TextEditingController(text: appState.getWeekReviewText()),
            decoration: InputDecoration(
                border: InputBorder.none, hintText: 'ここに振り返りを入力'),
            onChanged: (text) {
              temp = text;
            },
          ),
          ElevatedButton(
              onPressed: () {
                appState.setReviewText(temp);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('保存しました'),
                  duration: Duration(seconds: 1),
                ));
              },
              child: Text('保存'))
        ],
      ),
    );
  }
}
