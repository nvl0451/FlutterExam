// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';

import 'package:flutter_exam/criteria_page.dart';

Route createRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(-1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

const List<String> colors = ["розовый", "желтый", "зеленый"];
const List<String> results = ["dialog", "snackbar"];
const List<String> directions = ["снизу вверх", "сверху вниз", "справа налево"];

void main() => runApp(MaterialApp(
      title: "App",
      home: ExamApp(),
    ));

class ExamApp extends StatefulWidget {
  const ExamApp({super.key});

  @override
  State<ExamApp> createState() => _ExamAppState();
}

class _ExamAppState extends State<ExamApp> {
  int colorPicked = -1;
  int resultPicked = -1;
  int directionPicked = -1;

  List<List<int>> pickerOptions = [];

  void switchPicked(int color, int result, int direction) {
    setState(() {
      colorPicked = color;
      resultPicked = result;
      directionPicked = direction;
    });
  }

  void pickNewOption() {
    if (pickerOptions.isEmpty) {
      refillPickerOptions();
    }

    var rand = new Random();

    int i = rand.nextInt(pickerOptions.length);
    List<int> optionPicked = pickerOptions[i];
    pickerOptions.removeAt(i);

    String myColor = colors[optionPicked[0]];
    String myResult = results[optionPicked[1]];
    String myDirection = directions[optionPicked[2]];

    String firstLine = "Использовать $myColor цвет";

    switchPicked(optionPicked[0], optionPicked[1], optionPicked[2]);

    Text snackBarText = Text(firstLine);

    SnackBar snackBar = SnackBar(
      content: Column(
        children: [
          Text("Ваш вариант экзамена:"),
          Text("Используйте $myColor цвет"),
          Text("Реализуйте вывод через $myResult"),
          Text("Двигайте экраны $myDirection")
        ],
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void refillPickerOptions() {
    for (var i = 0; i < 3; i++) {
      for (var j = 0; j < 2; j++) {
        for (var k = 0; k < 3; k++) {
          List<int> newOption = [i, j, k];
          pickerOptions.add(newOption);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exam Picker"),
        backgroundColor: Colors.yellow,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Text(
                "Основной цвет",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: (colorPicked == 0)
                            ? Colors.yellow.shade200
                            : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.yellow)),
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "Розовый",
                      style: TextStyle(),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: (colorPicked == 1)
                            ? Colors.yellow.shade200
                            : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.yellow)),
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "Желтый",
                      style: TextStyle(),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: (colorPicked == 2)
                            ? Colors.yellow.shade200
                            : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.yellow)),
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "Зеленый",
                      style: TextStyle(),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "Показ результата",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: (resultPicked == 0)
                            ? Colors.yellow.shade200
                            : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.yellow)),
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "Dialog",
                      style: TextStyle(),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: (resultPicked == 1)
                            ? Colors.yellow.shade200
                            : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.yellow)),
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "Snackbar",
                      style: TextStyle(),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "Переход",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 25,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: (directionPicked == 0)
                              ? Colors.yellow.shade200
                              : Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.yellow)),
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "Снизу вверх",
                        style: TextStyle(),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: (directionPicked == 1)
                              ? Colors.yellow.shade200
                              : Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.yellow)),
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "Сверху вниз",
                        style: TextStyle(),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: (directionPicked == 2)
                              ? Colors.yellow
                              : Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.yellow)),
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "Справо налево",
                        style: TextStyle(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      pickNewOption();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.yellow.shade600,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.yellow)),
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "Получить результат",
                        style: TextStyle(),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(createRoute(CriteriaPage()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.yellow.shade600,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.yellow)),
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "Критерии",
                        style: TextStyle(),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
