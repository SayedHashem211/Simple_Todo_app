import 'package:flutter/material.dart';
import 'package:learn_x_sa3a_pro1/main.dart';


class Counter extends StatelessWidget {

  int allTodos;
  int allCompleted;

  Counter({Key? key, required this.allTodos, required this.allCompleted}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 27),
      child: Text("$allCompleted/$allTodos",style: TextStyle(
          fontSize: 44,
          fontWeight: FontWeight.bold,
          color: allCompleted==allTodos?Colors.greenAccent[400]:Colors.white
      ),),
    );
  }
}
