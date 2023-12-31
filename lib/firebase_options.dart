// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        return android;
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
    apiKey: 'AIzaSyA6CBqIZRvkaTeAkt1dkGMNoWesV1lxOLk',
    appId: '1:787162975286:web:d7190471c3d9238a231c97',
    messagingSenderId: '787162975286',
    projectId: 'flutter-final-exam-9bcaf',
    authDomain: 'flutter-final-exam-9bcaf.firebaseapp.com',
    storageBucket: 'flutter-final-exam-9bcaf.appspot.com',
    measurementId: 'G-ZH2SZ0X6CX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCv7CMgYwh7LP7iYGUCld_zAg926rROMWQ',
    appId: '1:787162975286:android:5ae3fc8f6be19ed4231c97',
    messagingSenderId: '787162975286',
    projectId: 'flutter-final-exam-9bcaf',
    storageBucket: 'flutter-final-exam-9bcaf.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAq930AGFTaDRGGMsoLK8ZkGRtlgCR5dsE',
    appId: '1:787162975286:ios:67d863d5b355f2fb231c97',
    messagingSenderId: '787162975286',
    projectId: 'flutter-final-exam-9bcaf',
    storageBucket: 'flutter-final-exam-9bcaf.appspot.com',
    iosBundleId: 'com.example.flutterFinalExam',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAq930AGFTaDRGGMsoLK8ZkGRtlgCR5dsE',
    appId: '1:787162975286:ios:5fd70d62c516bd36231c97',
    messagingSenderId: '787162975286',
    projectId: 'flutter-final-exam-9bcaf',
    storageBucket: 'flutter-final-exam-9bcaf.appspot.com',
    iosBundleId: 'com.example.flutterFinalExam.RunnerTests',
  );
}
