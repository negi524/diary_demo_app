import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseConfig {
  /// FireStoreのインスタンスを初期化する
  static FirebaseFirestore fireStore() {
    return FirebaseFirestore.instance;
  }
}
