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
        return android;
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBMJ7L3qlFgYGUGIETCjtCAPPM6QnVXY0A',
    appId: '1:794567851819:web:4de9788479491f70080f6e',
    messagingSenderId: '794567851819',
    projectId: 'indexacion-72846',
    authDomain: 'indexacion-72846.firebaseapp.com',
    storageBucket: 'indexacion-72846.firebasestorage.app',
    measurementId: 'G-0D68ND5Q5T',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDXE1xO8zsM3PQFUEngtYu5gbSur-u3U1k',
    appId: '1:794567851819:android:22031a6ea9ecb1d1080f6e',
    messagingSenderId: '794567851819',
    projectId: 'indexacion-72846',
    storageBucket: 'indexacion-72846.firebasestorage.app',
  );
}
