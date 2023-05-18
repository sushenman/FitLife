import 'package:fitlife/Screens/Login/login.dart';
import 'package:flutter/material.dart';

import '../../Signup/sign_up.dart';

class loginorsignup extends StatelessWidget {
  const loginorsignup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      
      

      child: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          //set the font size of the text
          const 
          Text(
            
            'Welcome to FitLife',
            style:TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black,)
            ),
          SizedBox(height: 20,),
          SizedBox(
            height: 40,
            width: 100,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: const Text('Login'),
            ),
          ),
          SizedBox(height: 40),
          const Text('OR'),
                 SizedBox(height: 40),
          SizedBox(
            height: 40,
            width: 100,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUp()),
                );
              },
              child: const Text('Sign Up'),
            ),
          ),
        ],
      ),
    );
  }
}
