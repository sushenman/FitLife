import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pedometer/pedometer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProgressBar extends StatefulWidget {
  const ProgressBar({Key? key}) : super(key: key);

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  double _progressValue = 0.0;
  int _targetSteps = 5000;
  DateTime _currentDate = DateTime.now();
  int _stepCount = 0;
  Stream<int> _stepCountStream = Stream<int>.empty();
  @override
  void initState() {
    super.initState();
    _loadStepCount();
    _initPedometer();
  }

  Future<void> _loadStepCount() async {
    final prefs = await SharedPreferences.getInstance();
    final lastDate = prefs.getString('lastDate');
    final currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

    if (lastDate != null && lastDate != currentDate) {
      // Reset step count to 0 if date changes
      await prefs.setInt('stepCount', 0);
      await prefs.setString('lastDate', currentDate);
      setState(() {
        _stepCount = 0;
      });
    } else {
      final storedStepCount = prefs.getInt('stepCount');
      setState(() {
        _stepCount = storedStepCount ?? 0;
      });
    }
  }

  void _initPedometer() {
    Pedometer.stepCountStream.listen((event) {
      final newStepCount = event.steps;
      setState(() {
        _stepCount = newStepCount;
        _calculateProgress();
        _saveStepCount();
        _updateStepCountInDatabase();
        _stepCountStream =
            Pedometer.stepCountStream.map((event) => event.steps);
      });
    });
  }

 void _updateStepCountInDatabase() async {
  final prefs = await SharedPreferences.getInstance();
  final lastDate = prefs.getString('lastDate');
  final currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

  if (lastDate != null && lastDate != currentDate) {
    // Reset step count in the database if date changes
    await addStepCount(0); // Pass 0 as the step count to reset it
    await prefs.setString('lastDate', currentDate);
  } else {
    final storedStepCount = prefs.getInt('stepCount');
    if (storedStepCount == null) {
      // New user, set step count to 0 in the database
      await addStepCount(0);
    } else {
      await addStepCount(_stepCount); // Pass the current step count
    }
  }
}


  Future<void> _saveStepCount() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('stepCount', _stepCount);
    await prefs.setString(
        'lastDate', DateFormat('yyyy-MM-dd').format(DateTime.now()));
  }

  void _calculateProgress() {
    setState(() {
      _progressValue = _stepCount.toDouble() / _targetSteps.toDouble();
      if (_progressValue > 1.0) {
        _progressValue = 1.0;
      }
    });
  }

  //store the step count in the database
  //call init function in the init state
  //call addStepCount function in the _initPedometer function

  Future<void> addStepCount(int stepCount) async {
    await Firebase.initializeApp();
    String uid = FirebaseAuth.instance.currentUser!.uid;
    CollectionReference collectionReference = FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('stepCount');
    //store the current date in a variable
    String date = DateFormat('yyyy-MM-dd').format(DateTime.now());
    //check if the date is already in the database
    //if it is, update the step count
    //if it isn't, add the date and step count
    
    collectionReference.doc(date).get().then((value) async {
      if (value.exists) {
        await collectionReference.doc(date).update({
          'stepCount': _stepCount,
        });
      } else {
        await collectionReference.doc(date).set({
          'stepCount': _stepCount,
          'Date': date,
        });
      }
    });
  }

// Future<void> addStepCount() async{
//   await Firebase.initializeApp();
//   print("hELLO");
//   String uid = FirebaseAuth.instance.currentUser!.uid;
//   CollectionReference collectionReference = FirebaseFirestore.instance.collection('users').doc(uid).collection('stepCount');
//   //store the current date in a variable
//   String date = DateFormat('yyyy-MM-dd').format(DateTime.now());
//   //check if the date is already in the database
//   //if it is, update the step count
//   //if it isn't, add the date and step count
//   collectionReference.doc(date).get().then((value) async{
//     if(value.exists){
//       await collectionReference.doc(date).update({
//         'stepCount': _stepCount,
//       });
//     }else{
//       await collectionReference.doc(date).set({
//         'stepCount': _stepCount,
//         'Date': date,
//       });
//     }
//   });
// }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: const Text(
              'Today',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              StreamBuilder<int>(
                  stream: _stepCountStream,
                  initialData: _stepCount,
                  builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                    return Text(
                      '${snapshot.data} Steps',
                      style: const TextStyle(),
                      textAlign: TextAlign.center,
                    );
                  }),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18.0),
                  child: StreamBuilder<int>(
                    stream: _stepCountStream,
                    initialData: _stepCount,
                    builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                      final double progressValue = snapshot.data!.toDouble() / _targetSteps.toDouble();
                      return LinearProgressIndicator(
                        value: progressValue,
                        minHeight: 30,
                        backgroundColor: const Color.fromARGB(255, 218, 218, 218),
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          Color.fromARGB(255, 122, 255, 65),
                        ),
                      );
                    }
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 100,
            right: 0,
            child: const Text(
              'Target: 5000 Steps',
              style: TextStyle(),
            ),
          ),
        ],
      ),
    );
  }
}
