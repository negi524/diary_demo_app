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
    if (userState.isLogin()) {
      return buildSignOutForm(userState);
    } else {
      return buildSignInForm(userState);
    }
  }
}

/// サインアウト用のボタンを表示する
Widget buildSignOutForm(UserState userState) {
  return Column(
    children: [
      Row(
        children: [
          ElevatedButton(
              onPressed: () {
                userState.signOut();
              },
              child: Text('sign out'))
        ],
      ),
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

/// サインイン用のフォームを表示する
Widget buildSignInForm(UserState userState) {
  // TODO: 変数で持つ
  return Column(
    children: [
      TextField(
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4.0))),
            hintText: 'メールアドレス'),
        keyboardType: TextInputType.emailAddress,
        onChanged: (mail) {
          // TODO: メールアドレス同期
        },
      ),
      TextField(
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4.0))),
            hintText: 'パスワード'),
        keyboardType: TextInputType.visiblePassword,
        onChanged: (mail) {
          // TODO: パスワード同期
        },
      ),
      ElevatedButton(
          onPressed: () {
            userState.signIn();
          },
          child: Text('sign in'))
    ],
  );
}
