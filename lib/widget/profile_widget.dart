import 'package:diary_demo_app/state/user_state.dart';
import 'package:diary_demo_app/widget/sign_in_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// 設定ページ
class ProfileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var userState = context.watch<UserState>();
    userState.checkSignInStatus();

    if (userState.isLogin()) {
      return buildSignOutForm(userState);
    } else {
      return SignInFormWidget();
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
