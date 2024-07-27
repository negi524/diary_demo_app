import 'package:diary_demo_app/domain/user_property.dart';
import 'package:flutter/material.dart';

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
  void login() {
    _userProperty = UserProperty.createAuthenticatedUser();
  }

  /// ログアウト処理
  void logout() {
    _userProperty = UserProperty.createAnonymousUser();
  }
}
