import 'package:flutter/material.dart';
import 'package:learn_x_sa3a_pro1/widgets/todo-card.dart';

import 'widgets/counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const TodoApp(),
    );
  }
}

class TodoApp extends StatefulWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  State<TodoApp> createState() => _TodoAppState();
}

//class for task(todo-card)
class Task {
  String title;
  bool status;

  Task({required this.title, required this.status});
}

class _TodoAppState extends State<TodoApp> {
  // List of todos
  List allTasks = [
    Task(title: "coffee", status: false),
    Task(title: "Studying", status: true),
    Task(title: "Tasks", status: true),
    Task(title: "Call Mom", status: true),
  ];

  // To remove todo when clicking on "delete" icon
  delete(int clickedIndex) {
    setState(() {
      allTasks.remove(allTasks[clickedIndex]);
    });
  }

  // To remove all todos when clicking on "delete_forever" icon in the appBar
  deleteAll() {
    setState(() {
      allTasks.removeRange(0, allTasks.length);
    });
  }

  // To change the state of the todo (completed or not completed) when click on the todo
  changeStatus(int taskIndex) {
    setState(() {
      allTasks[taskIndex].status = !allTasks[taskIndex].status;
    });
  }

  //To add new todo when clicking on "ADD" in the floatingActionButton
  addNewTask() {
    setState(() {
      allTasks.add(
        Task(title: myController.text, status: false),
      );
    });
  }

  // create controller to get the text inside the text field in the floatingActionButton
  final myController = TextEditingController();

  // To calculate only completed todos

  int calculateCompletedTasks() {
    int completedTasks = 0;

    allTasks.forEach((element) {
      if (element.status) {
        completedTasks++;
      }
    });

    return completedTasks;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(58, 66, 86, 0.7),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                deleteAll();
              },
              icon: const Icon(
                Icons.delete_forever,
                size: 37,
                color: Color.fromARGB(255, 255, 188, 214),
              ))
        ],
        elevation: 0, //shadow
        backgroundColor: const Color.fromRGBO(58, 66, 86, 1),
        title: const Text(
          "TO DO APP",
          style: TextStyle(
              fontSize: 33, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Counter(
                allCompleted: calculateCompletedTasks(),
                allTodos: allTasks.length,
              ),

              Container(
                margin: const EdgeInsets.only(top: 22),
                height: 550,
                color: Colors.teal[180],
                child: ListView.builder(
                    itemCount: allTasks.length,
                    itemBuilder: (BuildContext context, int index) {
                      return TodoCard(
                        // I will pass all these info when create the todocard() widget in "todo-card.dart"
                        varTitle: allTasks[index].title,
                        doneOrNot: allTasks[index].status,
                        changeStatus: changeStatus,
                        index: index,
                        delete: delete,
                      );
                    }),
              ),
        ]
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                padding: const EdgeInsets.all(22),
                height: double.infinity,
                color: Colors.amber[100],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: myController,
                      maxLength: 20,
                      decoration: const InputDecoration(hintText: "Add new Task"),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    TextButton(
                        onPressed: () {
                          addNewTask();
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "ADD",
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ))
                  ],
                ),
              );
            },
            isScrollControlled: true,
          );
        },
        backgroundColor: Colors.redAccent,
        child: const Icon(Icons.add),
      ),
    );
  }
}






/*
// before update =>
              // ...allTasks
              //     .map((item) => TodoCard(
              //           varTitle: item.title,
              //           doneOrNot: item.status,
              //         ))
              //     .toList()
              //without ... , it will return list with brackets but with ... , it will remove brackets and do the same purpose of => TodoCard(), TodoCard(), TodoCard(), --- notice that map يتكرر الكود اللي بعد السهم بعدد عناصر الليست
            ],
 */
