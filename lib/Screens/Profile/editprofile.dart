import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
 TextEditingController _nameController = TextEditingController();
 StreamController<String> _nameStreamController = StreamController<String>();
   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final FirebaseAuth _auth = FirebaseAuth.instance;

 initState(){
  //get user data
  String userId = _auth.currentUser!.uid;

  //get name of the user
  _firestore.collection('users').doc(userId).collection('us').doc(userId).get().then((value) {
    value.data()!.forEach((key, value) {
      print(value);
    });
    // print(value.data());

  });
}
void dispose() {
  _nameStreamController.close();
  // super.dispose();
}
void updateUserData(String name) {
        print('hello');
  String userId = _auth.currentUser!.uid;
  _firestore.collection('users').doc(userId).collection('us').doc(userId).update({'name': name});
}
class EditProfile extends StatelessWidget {
  const EditProfile({Key? key});

  @override
  Widget build(BuildContext context) {
   
    // value = _nameController.text;
print(_nameController.text);
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
              ),
               SizedBox(height: 20),
                 TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Height',
                ),
              ),
                SizedBox(height: 20),
                 TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Weight',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  String newName = _nameController.text.trim();
                  if (newName.isNotEmpty) {
                    updateUserData(newName);
                    Navigator.pop(context); // Go back to previous screen
                  }
                },
                child: Text('Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
