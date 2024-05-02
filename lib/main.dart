import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/app.dart';
import 'package:social/simple_bloc_observer.dart';
import 'package:user_repository/user_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: const FirebaseOptions(
    apiKey: 'AIzaSyAN2C-OR1-Wpv4P1f5BNkXCDrQgknW3Xmg',
    appId: '347176491062',
    messagingSenderId: 'sendid',
    projectId: 'social-f9fff',
    // storageBucket: 'myapp-b9yt18.appspot.com',
  ));
  Bloc.observer = SimpleBlocObserver();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp( MyApp(userRepository: FirebaseUserRepository(),));
}
