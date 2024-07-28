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
  factory UserProperty.createAuthenticatedUser({
    required String userId,
    required String userName,
  }) {
    return UserProperty._(id: userId, name: userName, isLogin: true);
  }
}
