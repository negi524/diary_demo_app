import 'package:diary_demo_app/domain/week_review.dart';
import 'package:diary_demo_app/page/review_edit_page.dart';
import 'package:flutter/material.dart';

/// 週の振り返りウィジェット
class WeekReviewWidget extends StatelessWidget {
  /// 週の振り返り
  final WeekReview weekReview;

  const WeekReviewWidget({super.key, required this.weekReview});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          Text('振り返り', style: Theme.of(context).textTheme.headlineLarge),
          SizedBox(width: 30),
          ElevatedButton(
              onPressed: () {
                // ボタンが押されたときの処理
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ReviewEditPage()));
              },
              child: Text('振り返り編集')),
        ]),
        SizedBox(height: 30),
        Text(weekReview.getReviewText()),
      ],
    );
  }
}
