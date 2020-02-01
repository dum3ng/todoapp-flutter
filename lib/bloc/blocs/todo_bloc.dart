import 'package:bloc/bloc.dart';

class Todo {
  String title = '';
  bool isCompleted = false;

  Todo({this.title, this.isCompleted = false});
}

class AppState {
  List<Todo> todos = [];
  String editingTitle = '';

  AppState({this.todos = const [], this.editingTitle = ''});

  toString() {
    return '<AppState>[${todos.length}] ';
  }
}

class BlocEvent {
  BlocEventType type;
  dynamic payload;

  BlocEvent(this.type, {this.payload});
}

enum BlocEventType { addItem, removeItem, toggleItem }

class AppStateBloc extends Bloc<BlocEvent, AppState> {
  @override
  Stream<AppState> mapEventToState(BlocEvent event) async* {
    // TODO: implement mapEventToState
    switch (event.type) {
      case BlocEventType.addItem:
        {
          List<Todo> todos = [...state.todos, event.payload];
          yield AppState(
              todos: todos,
              editingTitle: state.editingTitle);
          break;
        }
      case BlocEventType.removeItem:
        {
          List<Todo> todos = List.of(state.todos);
          todos.remove(event.payload);
          yield AppState(
              todos: todos,
              editingTitle: state.editingTitle);
          break;
        }
      default:
        yield state;
    }
  }

  @override
  // TODO: implement initialState
  AppState get initialState => AppState();
}
