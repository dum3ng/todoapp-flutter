import 'package:redux/redux.dart';
import 'package:uuid/uuid.dart';

var uuid = Uuid();

class Todo {
  String id;
  String title = '';
  bool isCompleted = false;

  Todo({this.title, this.isCompleted = false}) : id = uuid.v1();
}

class AppState {
  List<Todo> todos = [];
  String editingTitle = '';

  AppState({this.todos, this.editingTitle});
}

enum ActionType {
  AddItem,
  RemoveItem,
  SetEditingTitle,
  ToggleAll,
  ToggleItem,
}

class Action {
  ActionType type;
  dynamic payload;

  Action({this.type, this.payload});
}

AppState appReducer(AppState state, dynamic _action) {
  var action = _action as Action;
  switch (action.type) {
    case ActionType.AddItem:
      return AppState(
          todos: [...state.todos, action.payload],
          editingTitle: state.editingTitle);
    case ActionType.RemoveItem:
      {
        List<Todo> todos = List.from(state.todos);
        todos.remove(action.payload);
        return AppState(todos: todos, editingTitle: state.editingTitle);
      }
    case ActionType.ToggleItem:
      {
        List<Todo> todos = List.from(state.todos);
        Todo todo = action.payload;
        var _todo = todos.firstWhere((e) => e.id == todo.id);
        _todo.isCompleted = !_todo.isCompleted;
        return AppState(todos: todos, editingTitle: state.editingTitle);
      }
    case ActionType.SetEditingTitle:
      {
        return AppState(todos: state.todos, editingTitle: action.payload);
      }
    case ActionType.ToggleAll:
    default:
      return state;
  }
}

var store = Store<AppState>(appReducer,
    initialState:
        AppState(todos: [Todo(title: 'hello redux', isCompleted: true)]));
