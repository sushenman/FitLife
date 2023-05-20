import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartApp extends StatelessWidget {
      String uid = FirebaseAuth.instance.currentUser!.uid;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  // final String date = _firestore.collection('users').doc(userId).collection('us').doc(userId);
  @override
  Widget build(BuildContext context) {
    
    final CollectionReference<Map<String, dynamic>> collection =
        firestore.collection('users').doc(uid).collection('stepCount').doc(date).collection('stepCount');

    return Scaffold(
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: collection.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }

          final List<Data> data = snapshot.data!.docs.map((doc) {
            final Map<String, dynamic> data = doc.data();
            final String date = data['date']; // Change 'date' to the field name that represents the date in your Firestore document
            final int stepCounter = data['stepCounter']; // Change 'stepCounter' to the field name that represents the step counter in your Firestore document
            return Data(date, stepCounter);
          }).toList();

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: 500, // Specify the fixed width of the chart container
              height: 200, // Specify the fixed height of the chart container
              child: SfCartesianChart(
                primaryXAxis: CategoryAxis(
                  isVisible: true,
                ),
                primaryYAxis: NumericAxis(
                  axisLine: AxisLine(width: 1),
                  majorTickLines: MajorTickLines(size: 0),
                  minorTickLines: MinorTickLines(size: 0),
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                  // Calculate the minimum and maximum values dynamically
                  minimum: data.isNotEmpty ? data.map((d) => d.value).reduce((a, b) => a < b ? a : b).toDouble() : 0,
                  maximum: data.isNotEmpty ? data.map((d) => d.value).reduce((a, b) => a > b ? a : b).toDouble() : 100,
                ),
                series: <ChartSeries>[
                  ColumnSeries<Data, String>(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black,
                    width: 0.1,
                    dataSource: data,
                    xValueMapper: (Data data, _) => data.category,
                    yValueMapper: (Data data, _) => data.value,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Data {
  final String category;
  final int value;

  Data(this.category, this.value);
}
