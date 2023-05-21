import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  final int allToDos;

  final int allCompletedTasks;

  const Counter(
      {super.key, required this.allToDos, required this.allCompletedTasks});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white38),
        borderRadius: BorderRadius.circular(13),
        color: const Color.fromRGBO(209, 224, 224, 0.2),
      ),
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Text(
        '$allCompletedTasks / $allToDos',
        style: TextStyle(
          //  condition ? true : false ,
          color:
          allCompletedTasks == allToDos ? Colors.green[400] : Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
