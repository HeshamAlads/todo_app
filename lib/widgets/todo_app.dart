// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todo_app/widgets/counter.dart';
import 'package:todo_app/widgets/todo_card.dart';

class ToDoApp extends StatefulWidget {
  const ToDoApp({Key? key}) : super(key: key);

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

// class for task(todo-card)
class Task {
  String title;
  bool status;

  Task({
    required this.title,
    required this.status,
  });
}

class _ToDoAppState extends State<ToDoApp> {
  // Create controller to  get the text inside the textField  in the dialog widget
  final myController = TextEditingController();

  // list of todos
  List allTasks = [
    Task(title: 'WakeUp Early', status: false),
    Task(title: 'Sleep Early', status: false),
    Task(title: 'Go to Gem', status: false),
    Task(title: 'Call Mom', status: false),
    Task(title: 'play Game', status: false),
  ];

  // To add new todo when clicking on "ADD" in the dialog widget
  addTask() {
    setState(() {
      allTasks.add(Task(title: myController.text, status: false));
    });
  }

  // To calculate only completed todos
  calcCompletedTasks() {
    int doneTasks = 0;
    for (var element in allTasks) {
      if (element.status) {
        doneTasks++;
      }
    }

    return doneTasks;
  }

  // To change the state of the todo (completed or not completed) when click on the todo
  changeStatus(int taskIndex) {
    setState(() {
      allTasks[taskIndex].status = !allTasks[taskIndex].status;
    });
  }

  // To remove todo  when clicking on "delete" icon
  delete(int taskIndex) {
    setState(() {
      allTasks.removeAt(taskIndex);
    });
  }

  // To remove all todos  when clicking on "delete" icon in the appBar
  deleteAll() {
    setState(() {
      allTasks.removeRange(0, allTasks.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: SizedBox(
                  height: 200,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField(
                              controller: myController,
                              maxLines: 20,
                              decoration: InputDecoration(
                                constraints:
                                    BoxConstraints.tight(Size.fromHeight(60)),
                                labelText: 'Add New Task',
                                enabledBorder: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                addTask();
                                Navigator.pop(context);
                              },
                              child: Text(
                                'ADD',
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ]),
                    ),
                  ),
                ),
              );
            },
          );
        },
        backgroundColor: Colors.redAccent,
        child: const Icon(Icons.add),
      ),
      backgroundColor: const Color.fromRGBO(58, 66, 86, 0.7),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              deleteAll();
            },
            color: Colors.green[500],
            icon: const Icon(
              Icons.delete,
            ),
            alignment: Alignment.center,
            iconSize: 35,
            padding: EdgeInsets.only(right: 15),
          )
        ],
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
            side: BorderSide(color: Colors.white38)),
        title: const Text(
          'Tasks',
          style: TextStyle(fontSize: 30),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(58, 66, 86, 1),
        elevation: 0,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Counter(
              allToDos: allTasks.length,
              allCompletedTasks: calcCompletedTasks(),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white38),
                  borderRadius: BorderRadius.circular(13),
                  color: Color.fromRGBO(58, 66, 86, 1),
                ),
                // height: 700,
                child: ListView.builder(
                  itemCount: allTasks.length,
                  itemBuilder: (context, index) {
                    return ToDoCard(
                      // I will pass all these information when create the ToDoCard() widget in "todo-card.dart" file
                      varTitle: allTasks[index].title,
                      doneOrNot: allTasks[index].status,
                      changeStatus: changeStatus,
                      index: index,
                      delete: delete,
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
