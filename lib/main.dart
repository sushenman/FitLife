import 'package:fitlife/Screens/Login/login.dart';
import 'package:fitlife/Screens/Login/loginorsignup.dart';
import 'package:fitlife/Screens/step_counter.dart';

import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'Firebase/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: loginorsignup(),
          //add theme
        ),
      ),
    );
  }
}
