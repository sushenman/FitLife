import 'package:flutter/material.dart';

import '../home.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
    
        width: double.infinity,
        height: 180,
        child: Stack(
          children: [Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Container
          
            (color: Colors.blue,),
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
                  Text('Hello,',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w100,
                  ),
                  ),
                  Text('Sara',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                ],
              ),
            ),
            //edit button on the left side
          Positioned(
  bottom: 20,
  right: 20,
  child: GestureDetector(
    onTap: () {
      // Implement your desired behavior here
      // Navigator.push( context , MaterialPageRoute(builder: (context) => Home()));
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
        ));
  }
}
