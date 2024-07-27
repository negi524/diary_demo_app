/// ユーザー情報
class UserProperty {
  /// ユーザーID
  final String id;

  /// ユーザー名
  final String name;

  /// ログイン状態
  final bool isLogin;

  UserProperty._({required this.id, required this.name, required this.isLogin});

  /// 未ログインユーザーを生成する
  factory UserProperty.createAnonymousUser() {
    return UserProperty._(id: '', name: '未ログイン', isLogin: false);
  }

  /// ログインユーザーを生成する
  factory UserProperty.createAuthenticatedUser() {
    return UserProperty._(id: 'AAA', name: 'テストユーザー', isLogin: true);
  }
}
