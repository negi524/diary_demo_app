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
  // 入力中のメールアドレス
  String inputMailAddress = '';
  // 入力中のパスワード
  String inputPassword = '';

  return Column(
    children: [
      TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.0))),
          hintText: 'メールアドレス',
          icon: Icon(Icons.mail),
        ),
        keyboardType: TextInputType.emailAddress,
        onChanged: (mail) => inputMailAddress = mail,
      ),
      TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.0))),
          hintText: 'パスワード',
          icon: Icon(Icons.key),
        ),
        keyboardType: TextInputType.visiblePassword,
        onChanged: (password) => inputPassword = password,
      ),
      ElevatedButton(
          onPressed: () {
            userState.signIn(inputMailAddress, inputPassword);
          },
          child: Text('sign in'))
    ],
  );
}
