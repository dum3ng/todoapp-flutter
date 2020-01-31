import 'package:mobx/mobx.dart';
import 'package:todo/mobx/todo.dart';

part 'todos.g.dart';

class Todos extends _Todos with _$Todos {
  Todos() {
    var todo = Todo();
    todo.setTitle('mobx');
    todos.add(todo);
  }
}

abstract class _Todos with Store {
  @observable
  ObservableList<Todo> todos = ObservableList<Todo>();

  @observable
  String editingTitle = '';

  @observable
  @action
  addItem(Todo todo) {
    todos.add(todo);
  }

  @action
  removeItem(Todo todo) {
    todos.remove(todo);
  }

  @action
  setEditingTitle(String t) {
    editingTitle = t;
  }

  @action
  toggleAll([bool value]) {
    if (value != null) {
      for (var todo in todos) {
        todo.toggleCompleted(value);
      }
    } else {
      for (var todo in todos) {
        todo.toggleCompleted();
      }
    }
  }
}
