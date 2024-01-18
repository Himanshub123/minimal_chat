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
    apiKey: 'AIzaSyA6wD1wtyifNkPCSuUHtU0RzCvK8KD7-2I',
    appId: '1:279911107616:web:6756a3fb2eee726f9b0045',
    messagingSenderId: '279911107616',
    projectId: 'minimalchat-ee060',
    authDomain: 'minimalchat-ee060.firebaseapp.com',
    storageBucket: 'minimalchat-ee060.appspot.com',
    measurementId: 'G-TR0C1T1F4E',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCckzyLi2yfve7ARCxkcVr7sJbOM1RGOi4',
    appId: '1:279911107616:android:289964053f5792049b0045',
    messagingSenderId: '279911107616',
    projectId: 'minimalchat-ee060',
    storageBucket: 'minimalchat-ee060.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAJNBkQH-yk59eFk3Sf8kxyenzYWKXoAUg',
    appId: '1:279911107616:ios:91103c2b10cd5af69b0045',
    messagingSenderId: '279911107616',
    projectId: 'minimalchat-ee060',
    storageBucket: 'minimalchat-ee060.appspot.com',
    iosBundleId: 'com.example.minalChatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAJNBkQH-yk59eFk3Sf8kxyenzYWKXoAUg',
    appId: '1:279911107616:ios:e75e8e545f291e4d9b0045',
    messagingSenderId: '279911107616',
    projectId: 'minimalchat-ee060',
    storageBucket: 'minimalchat-ee060.appspot.com',
    iosBundleId: 'com.example.minalChatApp.RunnerTests',
  );
}