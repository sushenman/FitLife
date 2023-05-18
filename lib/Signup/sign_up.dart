import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitlife/Signup/user_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool obscureText= true;
 //firebase auth
  void dispose(){
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
 Future<void> _register() async {
  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _userNameController.text,
      password: _passwordController.text,
    );
    
    // Send email verification
    await userCredential.user!.sendEmailVerification();

    // Display a success message
    var success = 'Registration Successful: ${userCredential.user}';

    // Check if the email is already verified
    if (userCredential.user!.emailVerified) {
      // Navigate to another page
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => UserDetails(),
        ),
      );
    } else {
      // Show a snackbar message asking the user to verify their email
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please verify your email address'),
        ),
      );
    }
  } on FirebaseAuthException catch (e) {
    // Registration failed, handle the error scenario here
    print('Registration Failed: $e');
    var success = 'Registration Failed: $e';
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Stack(
      children: [
    
        Center(
          child: Container(

            // margin: EdgeInsets.only(bottom: 10),
            height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(20),
            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //  Text(${success}), 
         
                
                Container(
                    margin: EdgeInsets.only(top: 20),
                    alignment: Alignment.topCenter,
                    child: const Text(
                      "Create new Account",
                      style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    )),
                const SizedBox(height: 60,),
                TextField(
                    controller: _userNameController,
                    // autofocus: true,
                    //  enabled: false,
                    // maxLength: 3,
                    decoration: const InputDecoration(
                      filled: true,
                      // fillColor: Colors.pink,
                     label: Text('Email'),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange),
                        borderRadius: BorderRadius.all(Radius.circular(100)),

                      ),

                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple),
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                      // prefix: Icon(Icons.person),//displays only after focus
                      prefixIcon: Icon(Icons.person), //displays always
                      // suffix: Text("Test"),
                      // suffixIcon: Icon(Icons.person),
                      // labelText: "Username",
                      // label: Text("Username"),
                    )),
                   const  SizedBox(height: 50,),
                  TextField(
                    controller: _passwordController,
                  style: const TextStyle(color: Colors.red),
                  obscureText:  obscureText,
                  decoration:  InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange),
                        borderRadius: BorderRadius.all(Radius.circular(100)),

                      ),

                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple),
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      
                    ),
                    //click on eye icon to toggle password visibility
                    suffix:GestureDetector(

                      child: obscureText? Icon
                      (CupertinoIcons.eye_slash) : Icon(CupertinoIcons.eye) ,
                      onTap:(){
                        setState(() {
                          obscureText= !obscureText;
                          
                      });},
                    ),
                    label: Text("Password"),
                  ),
                ),
                const SizedBox(height: 70,),
                // MaterialButton(onPressed: onPressed),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)),
                       
                      ),
                      onPressed: () {
                      _register();
                      },
                      child: const Text("Sign Up")),
                ),

                const SizedBox(
                  height: 20,
                ),
               
              ],   
              //display success or failure message
            
        ),)
            )],
    )));
}
}