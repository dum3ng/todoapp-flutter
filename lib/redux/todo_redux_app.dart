import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:todo/redux/todos.dart' as t;

//var store = Store t.AppState(todos: [t.Todo(title: 'hello redux')], editingTitle: '');

class TodoReduxApp extends StatelessWidget {
  final Store<t.AppState> store;

  TodoReduxApp({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
        store: store,
        child: MaterialApp(
            home: Scaffold(
          floatingActionButton: FloatingActionButton(
            child: StoreConnector<t.AppState, VoidCallback>(
              converter: (state) =>
                  () => state.dispatch(t.Action(type: t.ActionType.AddItem)),
              builder: (context, add) => IconButton(
                icon: Icon(Icons.add),
                onPressed: () => showEdit(context),
              ),
            ),
          ),
          body: StoreConnector<t.AppState, List<t.Todo>>(
            converter: (state) => store.state.todos,
            builder: (context, todos) {
              print('todos length: ${todos.length}');
              return ListView.builder(
                itemBuilder: (context, index) {
                  return buildItem(todos[index]);
                },
                itemCount: todos.length,
              );
            },
          ),
        )));
  }

  void showEdit(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => StoreProvider(
            store: store,
            child: StoreConnector<t.AppState, dynamic>(
                converter: (store) => {
                      'add': (todo) => store.dispatch(
                          t.Action(type: t.ActionType.AddItem, payload: todo)),
                      'editingTitle': store.state.editingTitle,
                      'setEditingTitle': (v) => store.dispatch(t.Action(
                          type: t.ActionType.SetEditingTitle, payload: v))
                    },
                builder: (context, vm) => Center(
                      child: Scaffold(
                          body: Column(children: [
                        TextField(
                          onChanged: (v) => vm['setEditingTitle'](v),
                        ),
                        RaisedButton(
                          child: Text('add'),
                          color: Colors.blue,
                          onPressed: () {
                            vm['add'](t.Todo(title: vm['editingTitle']));
                            Navigator.of(context).pop();
                          },
                        )
                      ])),
                    ))));
  }

  Widget buildItem(
    t.Todo todo,
  ) {
    print(todo);
    return StoreConnector<t.AppState, dynamic>(
      converter: (store) => {
        'toggleItem': (todo) => store
            .dispatch(t.Action(type: t.ActionType.ToggleItem, payload: todo)),
        'removeItem': (todo) => store
            .dispatch(t.Action(type: t.ActionType.RemoveItem, payload: todo))
      },
      builder: (context, actions) => ListTile(
        title: Text(todo.title),
        trailing: IconButton(
          icon: Icon(Icons.delete_forever, color: Colors.red),
          onPressed: () => actions['removeItem'](todo),
        ),
        leading: IconButton(
            onPressed: () => actions['toggleItem'](todo),
            icon: Icon(todo.isCompleted ? Icons.check : Icons.blur_circular)),
      ),
    );
  }
}

var aReduxApp = TodoReduxApp(
  store: t.store,
);
