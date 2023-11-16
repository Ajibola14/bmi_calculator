import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  final String bmi;
  final String weightStatus;
  final Color color;
  const ResultsPage(
      {super.key,
      required this.color,
      required this.bmi,
      required this.weightStatus});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Center(
        child: Card(
          elevation: 5,
          color: Colors.deepPurple[200],
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  weightStatus,
                  style: TextStyle(fontSize: 35),
                ),
              ),
              Text(
                bmi,
                style: TextStyle(color: color, fontSize: 30),
              ),
              CircularProgressIndicator.adaptive()
            ],
          ),
        ),
      ),
    );
  }
}
