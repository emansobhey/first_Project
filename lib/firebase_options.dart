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
    apiKey: 'AIzaSyDGinun9ImdbexiTTxFd43W6DLD4ALIKmk',
    appId: '1:773473165812:web:73008852b14dac553e59a1',
    messagingSenderId: '773473165812',
    projectId: 'myproject-f56ca',
    authDomain: 'myproject-f56ca.firebaseapp.com',
    storageBucket: 'myproject-f56ca.appspot.com',
    measurementId: 'G-1NWXJHFFRG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAZ5Sdf_kvnyGAfMeIq5YlQgh_PM0XESH8',
    appId: '1:773473165812:android:1685946d84109bb33e59a1',
    messagingSenderId: '773473165812',
    projectId: 'myproject-f56ca',
    storageBucket: 'myproject-f56ca.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyArOBd5InszIRxkIEIiq2iB1Br_Grvm4rw',
    appId: '1:773473165812:ios:c15aa189651f05443e59a1',
    messagingSenderId: '773473165812',
    projectId: 'myproject-f56ca',
    storageBucket: 'myproject-f56ca.appspot.com',
    iosBundleId: 'com.example.project',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyArOBd5InszIRxkIEIiq2iB1Br_Grvm4rw',
    appId: '1:773473165812:ios:be072d366e959c863e59a1',
    messagingSenderId: '773473165812',
    projectId: 'myproject-f56ca',
    storageBucket: 'myproject-f56ca.appspot.com',
    iosBundleId: 'com.example.project.RunnerTests',
  );
}
