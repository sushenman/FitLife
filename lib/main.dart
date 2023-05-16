import 'package:fitlife/Screens/Login/login.dart';
import 'package:fitlife/Screens/bottom_navigation.dart';
import 'package:fitlife/Screens/Profile/profile.dart';
import 'package:fitlife/Screens/step_counter.dart';
import 'package:fitlife/Signup/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:fitlife/Screens/Login/loginorsignup.dart';

import 'package:firebase_core/firebase_core.dart';
import 'Firebase/firebase_options.dart';
import 'Screens/Fitness.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(

 debugShowCheckedModeBanner: false,

      home: Scaffold(
        //add theme

        body: Center(
           //call profile.dart

          child: fitnessVideo(),
         //add theme

        ),
      ),
    );
  }
}