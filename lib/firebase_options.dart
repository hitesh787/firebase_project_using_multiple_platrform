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
    apiKey: 'AIzaSyBUbJMg9BbEmKL2DUjiS8ktRF3-wBJqY3k',
    appId: '1:486286152963:web:8a587f31b4fda7f4d5c536',
    messagingSenderId: '486286152963',
    projectId: 'flutterprojectformultiplepalt',
    authDomain: 'flutterprojectformultiplepalt.firebaseapp.com',
    storageBucket: 'flutterprojectformultiplepalt.appspot.com',
    measurementId: 'G-GDDTJV1QSC',
  );


  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA6aBp8RgSvjk0_Jrd8wYXCMYSR4UQKFUw',
    appId: '1:486286152963:android:d2729f726ea0baaad5c536',
    messagingSenderId: '486286152963',
    projectId: 'flutterprojectformultiplepalt',
    storageBucket: 'flutterprojectformultiplepalt.appspot.com',
  );


  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD4x9mcf9oHqQ6mNXR6oiWn8mH2mx34AzI',
    appId: '1:486286152963:ios:18c42c2969210569d5c536',
    messagingSenderId: '486286152963',
    projectId: 'flutterprojectformultiplepalt',
    storageBucket: 'flutterprojectformultiplepalt.appspot.com',
    iosBundleId: 'com.example.firebaseProjectUsingMultiplePlatrform',
  );


  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD4x9mcf9oHqQ6mNXR6oiWn8mH2mx34AzI',
    appId: '1:486286152963:ios:62699130f19ec8d5d5c536',
    messagingSenderId: '486286152963',
    projectId: 'flutterprojectformultiplepalt',
    storageBucket: 'flutterprojectformultiplepalt.appspot.com',
    iosBundleId: 'com.example.firebaseProjectUsingMultiplePlatrform.RunnerTests',
  );
}