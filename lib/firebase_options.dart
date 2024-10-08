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
    apiKey: 'AIzaSyAjiAGFRvqBM9nYkkioYkjIALmOEWfFW-k',
    appId: '1:99999575107:web:7fd00471aaf5191c3278f6',
    messagingSenderId: '99999575107',
    projectId: 'swiftcafe-aa22e',
    authDomain: 'swiftcafe-aa22e.firebaseapp.com',
    storageBucket: 'swiftcafe-aa22e.appspot.com',
    measurementId: 'G-SK1HE8SSL0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBV0duKpzPKAZDzJWr0uU48c0A24lrw6gk',
    appId: '1:99999575107:android:92260e5c9bbac7f53278f6',
    messagingSenderId: '99999575107',
    projectId: 'swiftcafe-aa22e',
    storageBucket: 'swiftcafe-aa22e.appspot.com',
  );
}
