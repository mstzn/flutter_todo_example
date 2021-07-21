import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_one/components/new_todo_textfield.dart';
import 'package:project_one/controller/todo_controller.dart';
import 'package:project_one/screens/home/components/body.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TodoController todoController = Get.put(TodoController());
  final fieldText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print(todoController.todos.length);
    return Scaffold(
      appBar: AppBar(
        title: Text("Yapılacaklar Listem"),
      ),
      extendBody: false,
      extendBodyBehindAppBar: false,
      bottomSheet: NewTodoTextField(
        fieldText: fieldText,
        todoController: todoController,
      ),
      body: Body(todoController: todoController),
    );
  }
}
