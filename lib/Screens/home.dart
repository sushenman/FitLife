import 'package:fitlife/Screens/Login/loginorsignup.dart';
import 'package:fitlife/Screens/bottom_navigation.dart';
import 'package:fitlife/Screens/Profile/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: ListView(
        //padding
        padding: EdgeInsets.all(10),
        //give bg color

        children: [
          Center(

              // width:double.infinity,
              // heightFactor:4,
              child: Image.asset('assets/images/logo_transparent.png')),
          //link the container to another page
          GestureDetector(
            child: Container(
              // color: Colors.white,
              //give max width
              width: double.infinity,
              height: 110,
              // padding: EdgeInsets.all(10),

              child: Column(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'Daily Activity',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      child: Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Container(
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.directions_walk,
                                    color: Colors.white,
                                  ),
                                  SizedBox(height: 9),
                                  Text(
                                    '0',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Icon(
                              Icons.local_fire_department_outlined,
                              color: Colors.white,
                            ),
                            SizedBox(height: 9),
                            Text(
                              '0',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.directions_walk,
                            color: Colors.white,
                          ),
                          SizedBox(height: 9),
                          Text(
                            '0',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ],
                  ))
                ],
              ),

              //boxshadow
              //give border radius

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 110, 110, 110),
              ),
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Profile()));
            },
          ),

          SizedBox(height: 10),
          Container(
            //give max width
            width: double.infinity,
            height: 110,

            child: Column(
              children: [
                Container(
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Food',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Text('0 ' + 'kcal',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Icon(Icons.add),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  onPrimary: Colors.black,
                                  shape: CircleBorder(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),

            //boxshadow
            //give border radius
            //boxshadow

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromARGB(255, 110, 110, 110),
            ),
          ),
          SizedBox(height: 10),
          Container(
            //give max width
            width: double.infinity,
            height: 110,

           child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        child: Text('Cycle Tracking',
            style: TextStyle(
              color: Colors.white,
            
            )),
      ),
    ),
    Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        child: Text('Track Your Cycle',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold
            )),
      ),
    ),
  ],
),


            //boxshadow
            //give border radius
            //boxshadow

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromARGB(255, 110, 110, 110),
            ),
          ),
             SizedBox(height: 10),
           Container(
            //give max width
            width: double.infinity,
            height: 110,

            child: Column(
              children: [
                Container(
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Water',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Text('0 ' + 'glasses',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Icon(Icons.add),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  onPrimary: Colors.black,
                                  shape: CircleBorder(),
                                ),
                              ),
                            ),
                                Container(
                              // margin: EdgeInsets.only(left: 10),
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Icon(Icons.remove),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  onPrimary: Colors.black,
                                  shape: CircleBorder(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),

            //boxshadow
            //give border radius
            //boxshadow

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromARGB(255, 110, 110, 110),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: bottom_navigation(),
    );
  }
}
