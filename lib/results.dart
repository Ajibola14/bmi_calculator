import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  final String bmi;
  final String weightStatus;
  final Color color;
  const ResultsPage({super.key,required this.color,required this.bmi, required this.weightStatus});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(weightStatus),
            Text(
              bmi,
              style: TextStyle(color: color,fontSize: 30),
            )
          ],
        ),
      ),
    );
  }
}
