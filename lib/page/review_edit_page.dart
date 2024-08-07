import 'package:diary_demo_app/state/week_goal_review_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReviewEditPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var weekState = context.watch<WeekGoalReviewState>();

    // 入力中のテキスト
    String inputText = weekState.getWeekReview().getReviewText();

    return Scaffold(
      appBar: AppBar(
        title: Text('振り返り編集ページ'),
        backgroundColor: Colors.blue[200],
      ),
      body: Column(
        children: [
          TextField(
            controller: TextEditingController(text: inputText),
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4.0))),
                hintText: 'ここに振り返りを入力'),
            maxLines: null,
            onChanged: (text) {
              inputText = text;
            },
          ),
          ElevatedButton(
              onPressed: () {
                weekState.setReview(inputText);
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
