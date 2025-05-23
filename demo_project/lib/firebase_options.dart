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
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyDAGL713C-huPNeS44ZXAD9ueJ_pUpEoms',
    appId: '1:1002848116470:web:14dd7df42a814fa07256d7',
    messagingSenderId: '1002848116470',
    projectId: 'demoproject-1a8dc',
    authDomain: 'demoproject-1a8dc.firebaseapp.com',
    storageBucket: 'demoproject-1a8dc.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCJEUjBfdXKky8VhpH-3WnSHd82ACM5T-w',
    appId: '1:1002848116470:android:62ad02d0c9324e477256d7',
    messagingSenderId: '1002848116470',
    projectId: 'demoproject-1a8dc',
    storageBucket: 'demoproject-1a8dc.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA5ymDCWGYkIsXQXFKfiEGSFDUbJC66Elk',
    appId: '1:1002848116470:ios:199f0417caf62a9e7256d7',
    messagingSenderId: '1002848116470',
    projectId: 'demoproject-1a8dc',
    storageBucket: 'demoproject-1a8dc.firebasestorage.app',
    iosBundleId: 'com.example.demoProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA5ymDCWGYkIsXQXFKfiEGSFDUbJC66Elk',
    appId: '1:1002848116470:ios:199f0417caf62a9e7256d7',
    messagingSenderId: '1002848116470',
    projectId: 'demoproject-1a8dc',
    storageBucket: 'demoproject-1a8dc.firebasestorage.app',
    iosBundleId: 'com.example.demoProject',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDAGL713C-huPNeS44ZXAD9ueJ_pUpEoms',
    appId: '1:1002848116470:web:eae88abf738c44a37256d7',
    messagingSenderId: '1002848116470',
    projectId: 'demoproject-1a8dc',
    authDomain: 'demoproject-1a8dc.firebaseapp.com',
    storageBucket: 'demoproject-1a8dc.firebasestorage.app',
  );
}
