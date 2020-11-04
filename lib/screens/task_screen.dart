import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_app/models/task_data.dart';
import 'package:todoey_app/widgets/task_list.dart';
import 'package:todoey_app/screens/add_task_screen.dart';
import 'package:todoey_app/models/task.dart';

class TasksScreen extends StatefulWidget {

  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  Widget buildBottomSheet(BuildContext context) {
    return SingleChildScrollView(
        child:Container(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: AddTaskScreen(
            //addTaskTitle: (newTaskTitle) {
              // setState(() {
              //   Provider.of<TaskData>(context).tasks.add(Task(name: newTaskTitle),);
              // });
              //Navigator.pop(context);
            //},
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        floatingActionButton: Builder(
          builder: (context){
            return FloatingActionButton(
              backgroundColor: Colors.lightBlueAccent,
              child: Icon(Icons.add),
              onPressed: (){
                showModalBottomSheet(
                  context: context,
                  builder: buildBottomSheet,
                  isScrollControlled: true,
                );
              },
            );
          },
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 60.0, left: 30.0, bottom: 30.0, right: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                      child: Icon(
                          Icons.list,
                          color: Colors.lightBlueAccent,
                          size: 30.0,
                      ),
                      backgroundColor: Colors.white,
                      radius: 30.0,
                  ),
                  SizedBox(height: 10.0,),
                  Text(
                      'Todoey',
                      style: TextStyle(
                        fontSize: 50.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                  ),
                  Text(
                    '${Provider.of<TaskData>(context).taskCount} Tasks',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 15.0),
                child: TaskList(),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}