import 'package:fitlife/Screens/Profile/editprofile.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final FirebaseAuth _auth = FirebaseAuth.instance;

    Future<DocumentSnapshot<Map<String, dynamic>>> fetchUserData() async {
      String userId = _auth.currentUser!.uid;
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await   _firestore.collection('users').doc(userId).collection('us').doc(userId).get();
      return snapshot;
    }

    return SizedBox(
      width: double.infinity,
      height: 180,
      child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        future: fetchUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Display a loading indicator while data is being fetched
            // return CircularProgressIndicator();
          }
          if (snapshot.hasError) {
            // Display an error message if data retrieval fails
            return Text('Error fetching data');
          }
          if (!snapshot.hasData || snapshot.data!.data() == null) {
            // Handle the case where there is no user data available
            return Text('No data available');
          }

          // Access the user data from the snapshot
          Map<String, dynamic> userData = snapshot.data!.data()!;

          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Container(color: Colors.blue),
              ),
              Positioned(
                top: 20,
                right: 20,
                child: CircleAvatar(
                  foregroundImage: AssetImage('assets/images/image.png'),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 40,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello,',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    Text(
                      userData['name'],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              // Edit button on the left side
              Positioned(
                bottom: 20,
                right: 20,
                child: GestureDetector(
                  onTap: () {
                    // Implement your desired behavior here
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditProfile()),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text('Edit Profile'),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
