// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for android - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyA124tvtS0A-3fUG7U6VHI2-yELUG4QVl8',
    appId: '1:112688536438:web:c01d25b6d7c770477bb857',
    messagingSenderId: '112688536438',
    projectId: 'diary-demo-app-53793',
    authDomain: 'diary-demo-app-53793.firebaseapp.com',
    storageBucket: 'diary-demo-app-53793.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBB6TyNZD4cY-Umj_SEy03kOXsIbO8b_34',
    appId: '1:112688536438:ios:200504de0fbb598f7bb857',
    messagingSenderId: '112688536438',
    projectId: 'diary-demo-app-53793',
    storageBucket: 'diary-demo-app-53793.appspot.com',
    iosBundleId: 'com.example.diaryDemoApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBB6TyNZD4cY-Umj_SEy03kOXsIbO8b_34',
    appId: '1:112688536438:ios:200504de0fbb598f7bb857',
    messagingSenderId: '112688536438',
    projectId: 'diary-demo-app-53793',
    storageBucket: 'diary-demo-app-53793.appspot.com',
    iosBundleId: 'com.example.diaryDemoApp',
  );
}