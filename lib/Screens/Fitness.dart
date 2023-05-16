import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class fitnessVideo extends StatefulWidget {
  const fitnessVideo({super.key});

  @override
  State<fitnessVideo> createState() => _fitnessVideoState();
}

class _fitnessVideoState extends State<fitnessVideo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: 100,
        color: Colors.black,
      ),
    );
  }
}