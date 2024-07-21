import 'package:diary_demo_app/state/week_goal_review_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WeekGoalEditPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var weekState = context.watch<WeekGoalReviewState>();

    // 入力中のテキスト
    String inputGoalText = weekState.getWeekGoal().getIdealStateText();
    String inputTodoListText = weekState.getWeekGoal().getTodoListText();

    return Scaffold(
      appBar: AppBar(
        title: Text('目標編集ページ'),
        backgroundColor: Colors.blue[200],
      ),
      body: Column(
        children: [
          Text('一週間が終わるときの理想の状態は？',
              style: Theme.of(context).textTheme.headlineLarge),
          TextField(
            controller: TextEditingController(text: inputGoalText),
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4.0))),
                hintText: 'ここに目標を入力'),
            onChanged: (text) {
              inputGoalText = text;
            },
          ),
          SizedBox(height: 50),
          Text('そのためにやることは？', style: Theme.of(context).textTheme.headlineLarge),
          TextField(
            controller: TextEditingController(text: inputTodoListText),
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4.0))),
                hintText: 'やることを入力'),
            maxLines: null,
            onChanged: (text) {
              inputTodoListText = text;
            },
          ),
          ElevatedButton(
              onPressed: () {
                weekState.setIdealState(inputGoalText);
                weekState.setTodoListText(inputTodoListText);
                // 保存したことを通知
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('保存しました'),
                  duration: Duration(seconds: 1),
                ));
              },
              child: Text('保存')),
        ],
      ),
    );
  }
}
