import 'package:flutter/material.dart';

class Personal_Best extends StatelessWidget {
  const Personal_Best({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        clipBehavior: Clip.hardEdge ,
        child: Container(
          width: double.infinity,
          height: 500,
          // color: Colors.amber,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
            
              children: [
                
                Text('Personal Best',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                
                
                ),
                GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(top:30.0),
                  children: [
                    Container(
                    
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          
                          children: [
                          Icon(Icons.directions_walk),
                              Text('1000',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            
                            
                            ),
                            Text('Steps',
                            style: TextStyle(
                              fontSize: 12,
                             
                            ),
                            
                            
                            ),
                                           
                          ],
                          
                        ),
                        
                      ),
                      
                    ),


                    Container(
                    
                      child: Column(
                        children: [
                          Icon(Icons.local_fire_department_outlined),
                          Text('1000',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          
                          
                          ),
                          Text('Calories',
                          style: TextStyle(
                            fontSize: 12,
                           
                          ),
                          
                          
                          ),
                          
                        ],
                      ),
                    ),

                    Container(
                    
                      child: Column(
                        children: [
                          Icon(Icons.directions_run_outlined),
                            Text('1000',
                          style: TextStyle(
                            fontSize: 16,
                           
                          ),
                          
                          
                          ),
                          Text('Distance',
                          style: TextStyle(
                            fontSize: 12,
                           
                          ),
                          
                          
                          ),
                        
                        ],
                      ),
                    ),

                  
                 
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}