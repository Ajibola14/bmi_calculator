import 'package:flutter/material.dart';

import 'results.dart';
import 'reusable_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

enum GenderSelection { Male, Female }

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GenderSelection selection = GenderSelection.Male;
  double _height = 100;
  double _weight = 70;
  int _age = 30;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple[400],
          elevation: 0,
          title: Text("BMI Calculator"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  ReusableCard(
                    color: selection == GenderSelection.Male
                        ? Colors.deepPurple[400]!
                        : Colors.deepPurple[100]!,
                    myChild: GestureDetector(
                      onTap: () {
                        setState(() {
                          selection = GenderSelection.Male;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Icon(
                              Icons.male,
                              size: 80,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "MALE",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  ReusableCard(
                    color: selection == GenderSelection.Female
                        ? Colors.deepPurple[400]!
                        : Colors.deepPurple[100]!,
                    myChild: GestureDetector(
                      onTap: () {
                        setState(() {
                          selection = GenderSelection.Female;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Icon(
                              Icons.female,
                              size: 80,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "FEMALE",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ReusableCard(
              color: Colors.deepPurple[400]!,
              myChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "HEIGHT",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        _height.round().toString(),
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "cm",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Slider(
                      thumbColor: Colors.purple[300],
                      activeColor: Colors.white,
                      value: _height,
                      max: 120,
                      onChanged: (newvalue) {
                        setState(() {
                          _height = newvalue;
                        });
                      })
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  ReusableCard(
                    color: Colors.deepPurple[400]!,
                    myChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "WEIGHT",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              _weight.toInt().toString(),
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "lb",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _weight++;
                                  });
                                },
                                child: Icon(
                                  Icons.add,
                                  size: 40,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _weight--;
                                  });
                                },
                                child: Icon(
                                  Icons.remove,
                                  size: 40,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  ReusableCard(
                    color: Colors.deepPurple[400]!,
                    myChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "AGE",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Text(
                          _age.toString(),
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _age++;
                                  });
                                },
                                child: Icon(
                                  Icons.add,
                                  size: 40,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _age--;
                                  });
                                },
                                child: Icon(
                                  Icons.remove,
                                  size: 40,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return ResultsPage();
                      },
                    ));
                  },
                  style: OutlinedButton.styleFrom(
                      minimumSize: Size(double.infinity, 40),
                      shape: StadiumBorder(),
                      side: BorderSide(color: Colors.deepPurple),
                      foregroundColor: Colors.deepPurple),
                  child: Text("Calculate")),
            )
          ],
        ),
      ),
    );
  }
}
