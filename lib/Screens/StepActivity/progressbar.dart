import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';

class ProgressBar extends StatefulWidget {
  final int stepCount;

  const ProgressBar(
    {
      Key? key, required this.stepCount
      }
    ) : super(key: key);

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  double _progressValue = 0.0;
  int _targetSteps = 5000;

  @override
  void initState() {
    super.initState();
    _calculateProgress();
  }

  void _calculateProgress() {
    if (widget.stepCount != null && widget.stepCount > 0) {
      setState(() {
        _progressValue = widget.stepCount.toDouble() / _targetSteps.toDouble();
        if (_progressValue > 1.0) {
          _progressValue = 1.0;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Text(
              'Today',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Text(
                '${widget.stepCount ?? 0} Steps',
                style: TextStyle(),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18.0),
                  child: LinearProgressIndicator(
                    value: _progressValue,
                    minHeight: 30,
                    backgroundColor: const Color.fromARGB(255, 218, 218, 218),
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Color.fromARGB(255, 122, 255, 65),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 100,
            right: 0,
            child: Text(
              'Target: $_targetSteps Steps',
              style: TextStyle(),
            ),
          ),
        ],
      ),
    );
  }
}
