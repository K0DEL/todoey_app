import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_app/models/task_data.dart';

// ignore: must_be_immutable
class AddTaskScreen extends StatelessWidget {
  String newTaskTitle;

  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
          padding: EdgeInsets.all(30.0),
          decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          children: [
            Text(
                'Add Item',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.lightBlueAccent,
                ),
            ),
            TextField(
              textAlign: TextAlign.center,
              autofocus: true,
              onChanged: (newTask){
                newTaskTitle = newTask;
              },
            ),
            SizedBox(height: 20.0,),
            RaisedButton(
                color: Colors.lightBlueAccent,
                onPressed: (){
                  //print(Provider.of<TaskData>(context,listen: false).tasks[0].name);
                  Provider.of<TaskData>(context,listen: false).addTask(newTaskTitle);
                  Navigator.pop(context);
                },
                child: Text(
                    'Add',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
