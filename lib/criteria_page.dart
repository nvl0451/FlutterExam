// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class CriteriaPage extends StatelessWidget {
  const CriteriaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Критерии"),
        backgroundColor: Colors.yellow,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Text("1) 0 баллов – работа не сделана"),
              ],
            ),
            Text(
                "2) 1-3 балла – генерация не работает, но интерфейс отрисован"),
            Text(
                "3) 4-5 балла – отрисован интерфейс одного экрана в заданном цвете"),
            Text(
                "4) 6-7 баллов – отрисован интерфейс экрана и показ результата"),
            Text(
                "5) 8-9 баллов – отрисован интерфейс двух экранов с кастомным переходом в соответствии с заданием и показ результата"),
            Text(
                "6) 10 баллов – все выполнено и комбинации заданий не повторяются (каждый раз уникальный набор, пока не закончится)")
          ],
        ),
      ),
    );
  }
}
