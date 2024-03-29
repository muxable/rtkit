// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBKa6NTybZO3BF-bctlGlVMjjGlTFErQFk',
    appId: '1:985944975135:android:713c15fab9a5621fd9722a',
    messagingSenderId: '985944975135',
    projectId: 'rtkit-53e95',
    storageBucket: 'rtkit-53e95.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCvWmS1DDiRstdOjzBhwDEJfe2btQ2lqIs',
    appId: '1:985944975135:ios:7574f11ec6faa34ed9722a',
    messagingSenderId: '985944975135',
    projectId: 'rtkit-53e95',
    storageBucket: 'rtkit-53e95.appspot.com',
    iosClientId:
        '985944975135-4kvo76upc10njb2q6tv5d6gj40ikqjne.apps.googleusercontent.com',
    iosBundleId: 'com.rtirl.kit',
  );
}
