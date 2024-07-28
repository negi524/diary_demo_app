import 'dart:math';

import 'package:diary_demo_app/domain/user_property.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

/// ユーザー情報のstate
class UserState extends ChangeNotifier {
  /// ユーザー
  late UserProperty _userProperty;

  /// コンストラクタ
  UserState() {
    _init();
  }

  void _init() {
    // 初期データ取得
    // TODO: 認証API呼ぶ
    _userProperty = UserProperty.createAnonymousUser();
  }

  /// ユーザーID取得
  String getUserId() {
    return _userProperty.id;
  }

  /// ユーザー名取得
  String getUserName() {
    return _userProperty.name;
  }

  /// ログイン状態判定
  bool isLogin() {
    return _userProperty.isLogin;
  }

  /// ログイン処理
  Future<void> signIn(String mail, String password) async {
    print('mail=$mail, password=$password');
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: mail, password: password);
      final userId = credential.user?.uid ?? '';
      const userName = 'テストユーザー1';
      _userProperty = UserProperty.createAuthenticatedUser(
        userId: userId,
        userName: userName,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      } else {
        print('サインイン時に原因不明のエラーが発生しました $e');
      }
    }
    notifyListeners();
  }

  /// ログアウト処理
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    _userProperty = UserProperty.createAnonymousUser();
    notifyListeners();
  }

  /// ログイン状態をチェックし、更新する
  /// TODO: 1回実行するように改善する
  Future<void> checkSignInStatus() async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        _userProperty = UserProperty.createAnonymousUser();
        notifyListeners();
      } else {
        var userId = user.uid;
        _userProperty = UserProperty.createAuthenticatedUser(
            userId: userId, userName: 'テストユーザーhogehoge');
        notifyListeners();
      }
    });
  }
}
