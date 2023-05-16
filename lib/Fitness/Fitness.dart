import 'package:flutter/material.dart';

class FitnessVideo extends StatefulWidget {
  const FitnessVideo({Key? key}) : super(key: key);

  @override
  _FitnessVideoState createState() => _FitnessVideoState();
}

class _FitnessVideoState extends State<FitnessVideo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 50),
          width: double.infinity,
          // height: double.infinity,
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  'Fitness',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                //box shadow to container
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 35, 35, 35).withOpacity(1),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mindfulness',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(6, (index) {
                          return Container(
                            width: 150,
                            height: 180,
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              // color: Colors.amber,
                            ),
                            child: Column(

                                // mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                //add photo
                                children: [
                                  Image.asset(
                                    'assets/images/logo.png',
                                    width: 130,
                                    height: 130,
                                    fit: BoxFit.contain,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 6),
                                    child: Text(
                                      'data',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                      textAlign: TextAlign.left,
                                    ),
                                  )
                                ]),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                //box shadow to container
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 35, 35, 35).withOpacity(1),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mindfulness',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(6, (index) {
                          return Container(
                            width: 150,
                            height: 180,
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              // color: Colors.amber,
                            ),
                            child: Column(

                                // mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                //add photo
                                children: [
                                  Image.asset(
                                    'assets/images/logo.png',
                                    width: 130,
                                    height: 130,
                                    fit: BoxFit.contain,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 6),
                                    child: Text(
                                      'data',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                      textAlign: TextAlign.left,
                                    ),
                                  )
                                ]),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                //box shadow to container
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 35, 35, 35).withOpacity(1),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mindfulness',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(6, (index) {
                          return Container(
                            width: 150,
                            height: 180,
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              // color: Colors.amber,
                            ),
                            child: Column(

                                // mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                //add photo
                                children: [
                                  Image.asset(
                                    'assets/images/logo.png',
                                    width: 130,
                                    height: 130,
                                    fit: BoxFit.contain,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 6),
                                    child: Text(
                                      'data',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                      textAlign: TextAlign.left,
                                    ),
                                  )
                                ]),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                //box shadow to container
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 35, 35, 35).withOpacity(1),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mindfulness',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(6, (index) {
                          return Container(
                            width: 150,
                            height: 180,
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              // color: Colors.amber,
                            ),
                            child: Column(

                                // mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                //add photo
                                children: [
                                  Image.asset(
                                    'assets/images/logo.png',
                                    width: 130,
                                    height: 130,
                                    fit: BoxFit.contain,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 6),
                                    child: Text(
                                      'data',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                      textAlign: TextAlign.left,
                                    ),
                                  )
                                ]),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
