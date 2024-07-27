import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

/// 設定ページ
class ProfileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('hoge');
      } else {
        print('fuga');
      }
    });
    return Text('Profile widget',
        style: Theme.of(context).textTheme.headlineLarge);
    // throw UnimplementedError();
  }
}
