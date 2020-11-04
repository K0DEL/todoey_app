import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_app/widgets/task_tile.dart';
import 'package:todoey_app/models/task_data.dart';

class TaskList extends StatelessWidget {

  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
        builder: (context,taskData,child) {
          return ListView.builder(
            physics: BouncingScrollPhysics(),
            controller: controller,
            itemBuilder: (context,index){
              final task = taskData.tasks[index];
              return TaskTile(
                  taskTitle: task.name,
                  isChecked: task.isDone,
                  checkBoxCallBack: (bool checkBoxState) {
                    taskData.updateTask(task);
                  },
                  longPressCallBack: (){
                    taskData.deleteTask(task);
                  },
              );
            },
            itemCount: taskData.taskCount,
          );
      },
    );
  }
}

