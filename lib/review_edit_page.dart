import 'package:diary_demo_app/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReviewEditPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    // 入力中のテキスト
    String inputText = '';

    return Scaffold(
      appBar: AppBar(
        title: Text('振り返り編集ページ'),
        backgroundColor: Colors.blue[200],
      ),
      body: Column(
        children: [
          TextField(
            controller:
                TextEditingController(text: appState.getWeekReviewText()),
            decoration: InputDecoration(
                border: InputBorder.none, hintText: 'ここに振り返りを入力'),
            onChanged: (text) {
              inputText = text;
            },
          ),
          ElevatedButton(
              onPressed: () {
                appState.setReviewText(inputText);
                // 保存したことを通知
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
