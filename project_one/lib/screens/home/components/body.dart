import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_one/controller/todo_controller.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.todoController,
  }) : super(key: key);

  final TodoController todoController;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TodoController>(
        init: todoController,
        global: false,
        builder: (controller) {
          return ListView.builder(
            itemCount: controller.todos.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: controller.todos[index].isEditing
                    ? TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.edit),
                          hintText: controller.todos[index].content,
                        ),
                        onSubmitted: (value) {
                          if (value != "") {
                            todoController.updateOne(index, value);
                          } else {
                            controller.todos[index].isEditing = false;
                            controller.update();
                          }
                        },
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              controller.todos[index].isEditing = true;
                              controller.update();
                            },
                            child: Text(
                              '${controller.todos[index].content}',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (_) => new AlertDialog(
                                  title: new Text("Silme İşlemini Onaylayın!"),
                                  content: new Text(
                                      "Bu yapılacak kaydını silmek istediğinizden emin misiniz?"),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        todoController.deleteOne(index);
                                        Navigator.of(context).pop();
                                      },
                                      child: Text(
                                        "Evet, %100",
                                        style: TextStyle(
                                          color: Colors.red.shade900,
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text("Vazgeç"),
                                    ),
                                  ],
                                ),
                              );
                            },
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red.shade900,
                            ),
                          ),
                        ],
                      ),
              );
            },
          );
        });
  }
}
