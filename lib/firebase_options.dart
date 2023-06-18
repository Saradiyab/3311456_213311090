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
    apiKey: 'AIzaSyDQD1XGezOEcsFWzEViQtsuyfXjuzLcqCY',
    appId: '1:702424020139:web:3378d3d40d1dab1605b3ee',
    messagingSenderId: '702424020139',
    projectId: 'food-app-ee3c4',
    authDomain: 'food-app-ee3c4.firebaseapp.com',
    storageBucket: 'food-app-ee3c4.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAu6tXfWYyEaWyvuseHbnVfvD1qDadPQdc',
    appId: '1:702424020139:android:1809e8fbf6c13fc605b3ee',
    messagingSenderId: '702424020139',
    projectId: 'food-app-ee3c4',
    storageBucket: 'food-app-ee3c4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBj4N9QpJ2JsYbCDVMD2dFJaZ0O3PV95p4',
    appId: '1:702424020139:ios:4d66b46df382dbf405b3ee',
    messagingSenderId: '702424020139',
    projectId: 'food-app-ee3c4',
    storageBucket: 'food-app-ee3c4.appspot.com',
    iosClientId: '702424020139-73l7vtqqko6tee52n2usoflocl3g5ii2.apps.googleusercontent.com',
    iosBundleId: 'at.mhmd.Foodapp',
  );
}
