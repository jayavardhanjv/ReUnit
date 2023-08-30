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
    apiKey: 'AIzaSyBTZQEuemEbXohH1HNnQllT9AyOkBt0DLI',
    appId: '1:576759230416:web:19e1a9be422ede661cd3d5',
    messagingSenderId: '576759230416',
    projectId: 'reunite-cc011',
    authDomain: 'reunite-cc011.firebaseapp.com',
    storageBucket: 'reunite-cc011.appspot.com',
    measurementId: 'G-ZGPRWTWFQ2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBpYqxFy6ow8eDeuD1pAya2VTGmLf8fLkE',
    appId: '1:576759230416:android:b88884834d31d8af1cd3d5',
    messagingSenderId: '576759230416',
    projectId: 'reunite-cc011',
    storageBucket: 'reunite-cc011.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDjDl0IixOmRVVOFZX9ZsVQXhOXZUwIfRU',
    appId: '1:576759230416:ios:497aae9c4da24b091cd3d5',
    messagingSenderId: '576759230416',
    projectId: 'reunite-cc011',
    storageBucket: 'reunite-cc011.appspot.com',
    iosClientId: '576759230416-r21svvd882kc7tth8fd961ceabevnm41.apps.googleusercontent.com',
    iosBundleId: 'com.example.gamingAccessoriesRentApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDjDl0IixOmRVVOFZX9ZsVQXhOXZUwIfRU',
    appId: '1:576759230416:ios:497aae9c4da24b091cd3d5',
    messagingSenderId: '576759230416',
    projectId: 'reunite-cc011',
    storageBucket: 'reunite-cc011.appspot.com',
    iosClientId: '576759230416-r21svvd882kc7tth8fd961ceabevnm41.apps.googleusercontent.com',
    iosBundleId: 'com.example.gamingAccessoriesRentApp',
  );
}
