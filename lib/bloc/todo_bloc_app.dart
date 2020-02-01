import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/bloc/blocs/todo_bloc.dart';

class TodoBlocApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => AppStateBloc(), child: TodoPage());
  }
}

class TodoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Text('add'),
        onPressed: () {
          var bloc = BlocProvider.of<AppStateBloc>(context);
          print(bloc.state);
          bloc.add(
              BlocEvent(BlocEventType.addItem, payload: Todo(title: 'hahah')));
        },
      ),
      body: BlocBuilder<AppStateBloc, AppState>(
        builder: (context, state) {
          print('bloc todo: ${state.todos.length}');
          var bloc = BlocProvider.of<AppStateBloc>(context);
          return ListView.builder(
            itemBuilder: (context, index) => ListTile(
              title: Text(state.todos[index].title),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => bloc.add(BlocEvent(BlocEventType.removeItem,
                    payload: state.todos[index])),
              ),
            ),
            itemCount: state.todos.length,
          );
        },
      ),
    );
  }
}
