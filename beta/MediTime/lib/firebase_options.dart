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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCS81Ez3mdefiU8Pka1zGYY3WmQ4JdwoVU',
    appId: '1:190696383052:web:7d128e14a7f701f61bcae9',
    messagingSenderId: '190696383052',
    projectId: 'meditime-login-4403c',
    authDomain: 'meditime-login-4403c.firebaseapp.com',
    storageBucket: 'meditime-login-4403c.appspot.com',
    measurementId: 'G-DVKPVZN7TH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCMBDz2Qo_J-fUk0UOw2Dz1WaKv_0aTalc',
    appId: '1:190696383052:android:05a242af56e837aa1bcae9',
    messagingSenderId: '190696383052',
    projectId: 'meditime-login-4403c',
    storageBucket: 'meditime-login-4403c.appspot.com',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCWvA19dPUQF6dGlePJZElrljkhnpasyhk',
    appId: '1:190696383052:ios:2391d253ac3e97811bcae9',
    messagingSenderId: '190696383052',
    projectId: 'meditime-login-4403c',
    storageBucket: 'meditime-login-4403c.appspot.com',
    iosClientId: '190696383052-539dosa72qhc20pmj96b7ju2ds4ngjdm.apps.googleusercontent.com',
    iosBundleId: 'com.example.medicineReminder',
  );
}