import 'package:get/get.dart';
import 'package:project_one/model/todo.dart';

class TodoController extends GetxController {
  List<Todo> todos = [];

  void addOne(String content) {
    Todo newTodo = Todo(content);

    this.todos.add(newTodo);

    update();
  }

  void deleteOne(int index) {
    this.todos.removeAt(index);

    update();
  }

  void updateOne(int index, String content) {
    this.todos[index] = Todo(content);

    update();
  }
}
