import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitlife/Screens/bottom_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Signup/user_details.dart';

class LoginScreen extends StatefulWidget {

const LoginScreen({Key? key}) : super(key: key);

@override
State<StatefulWidget> createState() {
return _MyLoginPageState();

}
}

class _MyLoginPageState extends State<LoginScreen> {

TextEditingController _userNameController = TextEditingController();
TextEditingController _passwordController = TextEditingController();
bool obscureText= true;
bool isFirstLogin = false; // Add the isFirstLogin variable

void dispose(){
_userNameController.dispose();
_passwordController.dispose();
super.dispose();
}
//firebase auth
Login() async { // Add async keyword to use await
FirebaseAuth.instance.signInWithEmailAndPassword(
email: _userNameController.text,
password: _passwordController.text,
).then((value) async {
print("Logged In");
  // Check the user's login history from SharedPreferences
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool wasFirstLogin = prefs.getBool('firstLogin') ?? true;
  
  if (wasFirstLogin) {
    isFirstLogin = true;
    // Store the updated login history
    await prefs.setBool('firstLogin', false);
  } else {
    isFirstLogin = false;
  }
  
  // Check if the user is verified and navigate accordingly
  if (value.user!.emailVerified) {
    print("Email is verified");
    
    if (isFirstLogin) {
      // Navigate to the first login page
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => UserDetails()), // Replace FirstLoginPage with your actual first login page
        (route) => false,
      );
    } else {
      // Navigate to the home page
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => bottom_navigation()),
        (route) => false,
      );
    }
  } else {
    print("Email is not verified");
  }
}).catchError((e){
  print(e);
});
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Stack(
      children: [
        Positioned(
            child: Image.asset('assets/images/Vector.png'),
            bottom: 0,
            right: 0),
        Center(
          child: Container(
            // margin: EdgeInsets.only(bottom: 10),
            height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Image.asset('assets/images/image.png'),
                Container(
                    margin: EdgeInsets.only(top: 20),
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "Login Details",
                      style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    )),
                TextField(
                    controller: _userNameController,
                    // autofocus: true,
                    //  enabled: false,
                    // maxLength: 3,
                    decoration: const InputDecoration(
                      filled: true,
                      // fillColor: Colors.pink,
                     label: Text('Username'),
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
                   const  SizedBox(height: 20,),
                  TextField(
                    controller: _passwordController,
                  style: const TextStyle(color: Colors.red),
                  obscureText:  obscureText,
                  decoration:  InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    
                     focusedBorder:const  OutlineInputBorder(
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
                Container(
                    margin: EdgeInsets.only(top: 20, bottom: 20),
                    alignment: Alignment.topRight,
                    child: Text(
                      "Forgot Password?",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    )),
                // MaterialButton(onPressed: onPressed),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                       Login();
                      },
                      child: const Text("Login")),
                ),

                const SizedBox(
                  height: 20,
                ),
               
              ],    
        ),)
            )],
    )));
  }
}
