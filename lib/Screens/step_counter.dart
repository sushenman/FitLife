import 'package:fitlife/Screens/StepActivity/progressbar.dart';
import 'package:fitlife/Screens/chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';
class StepCounter extends StatefulWidget {
  const StepCounter({super.key});

  @override
  State<StepCounter> createState() => _StepCounterState();
}
class _StepCounterState extends State<StepCounter> {
  Stream<StepCount>? _stepCountStream;
  int _currentStepCount = 0;

  @override
  void initState() {
    super.initState();
    _startStepCountStream();
  }

  void _startStepCountStream() {
    Pedometer.stepCountStream.listen((StepCount event) {
      setState(() {
        _currentStepCount = event.steps;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Steps'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height - kToolbarHeight, // Set a specific height constraint
        padding: EdgeInsets.symmetric(vertical: 20),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Center(
                
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 500,
                        height: 250, // 
                      child: Container(
                        child: ChartApp(),
                      ),
                    ),
                      
                    Container(
                          //bg color change
                     
                      child: Column(
                        children: [
                          SizedBox(
                                
                            // width: 300,
                              height: 500, // 
                            child: Container(
                           color: Colors.transparent,
                                     
                                child:  ProgressBar(stepCount: 0),
                             
                              ),
                            ),

                        ],
                      ),
                    ),
                
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

