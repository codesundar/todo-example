// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
    // ignore: missing_enum_constant_in_switch
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCYX92hmGb4eQau3vpESiGAY0Z28oxeCfc',
    appId: '1:426741375411:web:88cb3527376758f9b02bc6',
    messagingSenderId: '426741375411',
    projectId: 'ksqure-learning',
    authDomain: 'ksqure-learning.firebaseapp.com',
    storageBucket: 'ksqure-learning.appspot.com',
    measurementId: 'G-RPPEBMQTTP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA8MpHYjs2wjy_RJAqjM6s6TpIAD2EkLEo',
    appId: '1:426741375411:android:35206dbc421148ccb02bc6',
    messagingSenderId: '426741375411',
    projectId: 'ksqure-learning',
    storageBucket: 'ksqure-learning.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAB6VryX6sHBE4D3cY7KORIAm1S0Ws1D9c',
    appId: '1:426741375411:ios:564c2decebedd55cb02bc6',
    messagingSenderId: '426741375411',
    projectId: 'ksqure-learning',
    storageBucket: 'ksqure-learning.appspot.com',
    iosClientId: '426741375411-hbiguj71slvps49d4i182bborvhtriit.apps.googleusercontent.com',
    iosBundleId: 'com.appmaking',
  );
}