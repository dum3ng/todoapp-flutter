// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todos.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Todos on _Todos, Store {
  final _$todosAtom = Atom(name: '_Todos.todos');

  @override
  ObservableList<Todo> get todos {
    _$todosAtom.context.enforceReadPolicy(_$todosAtom);
    _$todosAtom.reportObserved();
    return super.todos;
  }

  @override
  set todos(ObservableList<Todo> value) {
    _$todosAtom.context.conditionallyRunInAction(() {
      super.todos = value;
      _$todosAtom.reportChanged();
    }, _$todosAtom, name: '${_$todosAtom.name}_set');
  }

  final _$editingTitleAtom = Atom(name: '_Todos.editingTitle');

  @override
  String get editingTitle {
    _$editingTitleAtom.context.enforceReadPolicy(_$editingTitleAtom);
    _$editingTitleAtom.reportObserved();
    return super.editingTitle;
  }

  @override
  set editingTitle(String value) {
    _$editingTitleAtom.context.conditionallyRunInAction(() {
      super.editingTitle = value;
      _$editingTitleAtom.reportChanged();
    }, _$editingTitleAtom, name: '${_$editingTitleAtom.name}_set');
  }

  final _$_TodosActionController = ActionController(name: '_Todos');

  @override
  dynamic addItem(Todo todo) {
    final _$actionInfo = _$_TodosActionController.startAction();
    try {
      return super.addItem(todo);
    } finally {
      _$_TodosActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeItem(Todo todo) {
    final _$actionInfo = _$_TodosActionController.startAction();
    try {
      return super.removeItem(todo);
    } finally {
      _$_TodosActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEditingTitle(String t) {
    final _$actionInfo = _$_TodosActionController.startAction();
    try {
      return super.setEditingTitle(t);
    } finally {
      _$_TodosActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic toggleAll([bool value]) {
    final _$actionInfo = _$_TodosActionController.startAction();
    try {
      return super.toggleAll(value);
    } finally {
      _$_TodosActionController.endAction(_$actionInfo);
    }
  }
}
