import 'package:fitlife/Screens/Profile/personal_best.dart';
import 'package:fitlife/Screens/Profile/summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fitlife/Screens/bottom_navigation.dart';
import 'header.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
      body: Container(
          child: Column(
            children: [
            
              AppHeader(),
              Padding(padding:  const EdgeInsets.all(8.0)),
            WeeklySummary(),
              Padding(padding:  const EdgeInsets.all(8.0)),
            Expanded(child: Personal_Best()),
      
      
           
            ],
          ),
        ),
        //  bottomNavigationBar: bottom_navigation(),
      );
  }
}
