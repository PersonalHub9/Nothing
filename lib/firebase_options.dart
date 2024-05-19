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
    apiKey: 'AIzaSyDZqorbAF8EoMCMVKQ5Q2hFauwXAKKjReI',
    appId: '1:209162912284:web:3e72c84c1c5d42e88415d9',
    messagingSenderId: '209162912284',
    projectId: 'online-shop-b3209',
    authDomain: 'online-shop-b3209.firebaseapp.com',
    storageBucket: 'online-shop-b3209.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBkFzClzoYCayLztYXOQ53xm7cIQZvDOdk',
    appId: '1:209162912284:android:ceeb8ac3db5089ac8415d9',
    messagingSenderId: '209162912284',
    projectId: 'online-shop-b3209',
    storageBucket: 'online-shop-b3209.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCFo0YT_Rso5oehw3V1CeytlkNYKGD-zpc',
    appId: '1:209162912284:ios:e92800737143420f8415d9',
    messagingSenderId: '209162912284',
    projectId: 'online-shop-b3209',
    storageBucket: 'online-shop-b3209.appspot.com',
    iosBundleId: 'com.example.minmalecommerce',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCFo0YT_Rso5oehw3V1CeytlkNYKGD-zpc',
    appId: '1:209162912284:ios:787789b934c1f6988415d9',
    messagingSenderId: '209162912284',
    projectId: 'online-shop-b3209',
    storageBucket: 'online-shop-b3209.appspot.com',
    iosBundleId: 'com.example.minmalecommerce.RunnerTests',
  );
}
