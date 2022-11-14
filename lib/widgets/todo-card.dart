import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  String varTitle;
  bool doneOrNot;
  Function changeStatus;
  int index;
  Function delete;

  TodoCard(
      {super.key, required this.varTitle,
      required this.doneOrNot,
      required this.changeStatus,
      required this.index,
      required this.delete});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        changeStatus(index);
      },
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Container(
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(209, 224, 224, 0.2),
            borderRadius: BorderRadius.circular(11),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                varTitle,
                style: TextStyle(
                  fontSize: 22,
                  color: doneOrNot
                      ? const Color.fromARGB(255, 27, 26, 26)
                      : Colors.white,
                  decoration: doneOrNot
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
              Row(
                children: [
                  Icon(
                    doneOrNot ? Icons.check : Icons.close,
                    size: 33,
                    color: doneOrNot ? Colors.green[700] : Colors.red[500],
                  ),
                  const SizedBox(
                    width: 17,
                  ),
                  IconButton(
                      onPressed: () {
                        delete(index);
                      },
                      icon: const Icon(
                        Icons.delete,
                        size: 27,
                        color: Colors.brown,
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
