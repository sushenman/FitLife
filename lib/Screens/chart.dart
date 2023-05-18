import 'package:fitlife/Screens/dataclass.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartApp extends StatelessWidget {

  final List<Data> data = [
    Data('1', 25),
    Data('2', 40),
    Data('3', 80),
    Data('4', 30),
    Data('6', 130),
    Data('7', 130),
    Data('8', 130),
    Data(' 9', 130),
    
  ];



  @override
  Widget build(BuildContext context) {
    double minYValue = data.map((d) => d.value).reduce((a, b) => a < b ? a : b);
    double maxYValue = data.map((d) => d.value).reduce((a, b) => a > b ? a : b);
    return Scaffold(

      body: SingleChildScrollView(

        scrollDirection: Axis.horizontal,
        child: SizedBox(
            width: 500, // Specify the fixed width of the chart container
          height: 200, // Specify the fixed height of the chart container
          child: SfCartesianChart(
    
            primaryXAxis: CategoryAxis(
            // maximum: maxYValue,
            // minimum: minYValue,
            //   labelRotation: 30,


              // borderWidth: 20,
                axisLine: AxisLine(width: 0.2),
              isVisible: true,
            ),
            primaryYAxis: NumericAxis(
              // isVisible: false,
             axisLine : AxisLine(width: 1),
              majorTickLines: MajorTickLines(size: 0),
              minorTickLines: MinorTickLines(size: 0),
              labelStyle: TextStyle(
                color: Colors.black,
                fontSize: 12,
              ),

             


              minimum: minYValue, // Set the minimum value for the Y-axis
              maximum: maxYValue, // Set the maximum value for the Y-axis
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
      ),
    );
  }
}


