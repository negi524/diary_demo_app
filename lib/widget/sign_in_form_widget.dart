import 'package:diary_demo_app/state/user_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInFormWidget extends StatefulWidget {
  @override
  State<SignInFormWidget> createState() => _SignInFormWidgetState();
}

class _SignInFormWidgetState extends State<SignInFormWidget> {
  // 入力中のメールアドレス
  String inputMailAddress = '';

  // 入力中のパスワード
  String inputPassword = '';

  @override
  Widget build(BuildContext context) {
    var userState = context.watch<UserState>();

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
}
