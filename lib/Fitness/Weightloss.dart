import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class WeightLoss extends StatefulWidget {
  const WeightLoss({super.key});

  @override
  State<WeightLoss> createState() => _WeightLossState();
}

class _WeightLossState extends State<WeightLoss> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body:  SingleChildScrollView(
              scrollDirection: Axis.horizontal,
            

              child: Container(
                //box shadow to container
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                   color: Color.fromARGB(255, 35, 35, 35).withOpacity(1),
                  //  border: Border.all(
                  //    color: Colors.blue,
                  //    width: 2,
                  //  ),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Color.fromARGB(255, 35, 35, 35).withOpacity(1),
                  //     spreadRadius: 5,
                  //     blurRadius: 5,

                  //   ),
                  // ],
                ),
             
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30) ,
                
                child: Row(
              
                  children: List.generate(6, (index) {
                    return Container(
                      width: 100,
                      height: 100,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.amber,
                      ),
                    );
                  }),
                ),
              ),
            ),
    );
  }
}