import 'package:flutter/material.dart';
import 'package:project_one/controller/todo_controller.dart';

class NewTodoTextField extends StatelessWidget {
  const NewTodoTextField({
    Key? key,
    required this.fieldText,
    required this.todoController,
  }) : super(key: key);

  final TextEditingController fieldText;
  final TodoController todoController;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: fieldText,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Yeni eklemek için içeriği buraya yazınız',
          prefixIcon: Icon(Icons.add),
        ),
        onSubmitted: (value) {
          if (value != "") {
            todoController.addOne(value);
            fieldText.clear();
          }
        },
      ),
    );
  }
}
