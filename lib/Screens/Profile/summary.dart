import 'package:flutter/material.dart';

class WeeklySummary extends StatelessWidget {
  const WeeklySummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      height: 150,
      // color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Aligns children to the start (left) of the column
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16, top: 16), // Adds some padding to the left and top of the text
            child: Text(
              'Weekly Summary',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                // fontWeight: FontWeight.bold,
              ),
              
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, top: 8,bottom: 10),
            child: Text(
              'This Week',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
             
              ),
             
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, top: 19),
            child: Text(
              'Average step                                                             '+ '  1000' + '  steps',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
             
              ),
             
            ),
          ),
           Padding(
            padding: EdgeInsets.only(left: 16, top: 8),
            child: Text(
              'Average Calorie burnt                                              '+ '  1000' + '  kcal',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
             
              ),
             
            ),
          ),
        ],

      ),
    );
  }
}
