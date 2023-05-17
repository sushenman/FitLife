import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitlife/Screens/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../Screens/home.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({Key? key});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _aboutmeController = TextEditingController();

  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

   int? selectedAge;

  @override
  Widget build(BuildContext context) {
    //create an function to store 1 to 100
    List<int> numbers = List.generate(100, (index) => index + 10);
    final _formkey = GlobalKey<FormState>();
    //get the user id
    String userId = FirebaseAuth.instance.currentUser!.uid;
    void addUserData() {
        int age = selectedAge ?? 0;
      _firestore.collection('users').doc(userId).collection('us').doc(userId).set({
        
        'name': _nameController.text,
        'aboutme': _aboutmeController.text,
        'age': age,
        'height': _heightController.text,
        'weight': _weightController.text,
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => bottom_navigation(),
        ),
      );
      
    }


    return Scaffold(
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  child: Center(
                    child: InkWell(
                      splashColor: Colors.white,
                      onTap: () {},
                      child: Image.asset(
                        'assets/images/logo.png',
                        height: 100,
                        width: 100,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Name',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                    labelText: 'Full Name',
                    contentPadding: EdgeInsets.all(10),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'About Me',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _aboutmeController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.face_retouching_natural),
                    labelText: 'Share Your fitness goals',
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Height (cm)',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _heightController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.height_sharp),
                    labelText: 'Height',
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Weight (lbs)',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                                TextField(
                  controller: _weightController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.monitor_weight_outlined),
                    labelText: 'Weight',
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: DropdownButton(
                    hint: Text('Select your age'),
                    value: selectedAge,
                    onChanged: (newValue) {
                      setState(() {
                        selectedAge = newValue ;
                      });
                     
                    },
                         
                    items: numbers.map((age) {
                      return DropdownMenuItem(
                        child: Text(age.toString()),
                        value: age,
                      );
                    }).toList(),
                  ),
                ),
                Container(
                  child: ElevatedButton(
                    onPressed: () {
                      // submit the form
                      addUserData();
                    },
                    child: Text('Sign Up'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

