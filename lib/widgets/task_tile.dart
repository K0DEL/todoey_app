import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {

  TaskTile({this.taskTitle,this.isChecked,this.checkBoxCallBack,this.longPressCallBack});

  final String taskTitle;
  final bool isChecked ;
  final Function checkBoxCallBack;
  final Function longPressCallBack;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallBack,
        title: Text(
            taskTitle,
          style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Checkbox(
          value: isChecked,
          onChanged: checkBoxCallBack,
        ),
    );
  }
}

