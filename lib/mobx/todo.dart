import 'package:mobx/mobx.dart';
import 'package:uuid/uuid.dart';

part 'todo.g.dart';

var uuid = Uuid();

class Todo extends _Todo with _$Todo {
  final String id;

  Todo() : id = uuid.v1();
}

abstract class _Todo with Store {
  @observable
  String title = '';

  @observable
  bool isCompleted = false;

  @action
  toggleCompleted([bool b]) {
    if (b != null)
      isCompleted = b;
    else
      isCompleted = !isCompleted;
  }

  @action
  setTitle(String v) {
    title = v;
  }
}
