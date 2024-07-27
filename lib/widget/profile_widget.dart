import 'package:diary_demo_app/state/user_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// 設定ページ
class ProfileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var userState = context.watch<UserState>();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('hoge');
      } else {
        print('fuga');
      }
    });
    userState.login();
    return Column(
      children: [
        Row(
          children: [
            Text('ユーザーID: '),
            Text(userState.getUserId()),
          ],
        ),
        Row(
          children: [
            Text('ユーザー名: '),
            Text(userState.getUserName()),
          ],
        ),
      ],
    );
  }
}
