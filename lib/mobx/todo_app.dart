import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todo/mobx/todos.dart';
import 'package:todo/mobx/todo.dart';

var store = Todos();

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => showEdit(context),
        ),
        body: Observer(
          builder: (context) => ListView.builder(
              itemCount: store.todos.length,
              itemBuilder: (context, index) {
                Todo todo = store.todos[index];
                return ListTile(
                  title: Text(todo.title),
                  leading: toggleButton(todo),
                  subtitle: Text(todo.id),
                  trailing: IconButton(
                    icon: Icon(Icons.delete_forever),
                    color: Colors.red,
                    onPressed: () => store.removeItem(todo),
                  ),
                );
              }),
        ));
  }

  Widget toggleButton(Todo todo) {
    return Observer(
        builder: (context) => IconButton(
              icon: Icon(todo.isCompleted ? Icons.check : Icons.blur_circular),
              onPressed: () => todo.toggleCompleted(),
            ));
  }

  showEdit(BuildContext context) async {
    String title = await showDialog(
        context: context,
        builder: (context) => Scaffold(
                body: Column(
              children: <Widget>[
                TextField(
                  onChanged: (v) => store.setEditingTitle(v),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Spacer(),
                      RaisedButton(
                        child: Text('cancel'),
                        color: Colors.red,
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      RaisedButton(
                        child: Text('add'),
                        color: Colors.blue,
                        onPressed: () {
                          Navigator.of(context).pop();
                          var todo = Todo();
                          todo.setTitle(store.editingTitle);
                          store.addItem(todo);
                          store.setEditingTitle('');
                        },
                      )
                    ],
                  ),
                )
              ],
            )));
  }
}
