// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Todo on _Todo, Store {
  final _$titleAtom = Atom(name: '_Todo.title');

  @override
  String get title {
    _$titleAtom.context.enforceReadPolicy(_$titleAtom);
    _$titleAtom.reportObserved();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.context.conditionallyRunInAction(() {
      super.title = value;
      _$titleAtom.reportChanged();
    }, _$titleAtom, name: '${_$titleAtom.name}_set');
  }

  final _$isCompletedAtom = Atom(name: '_Todo.isCompleted');

  @override
  bool get isCompleted {
    _$isCompletedAtom.context.enforceReadPolicy(_$isCompletedAtom);
    _$isCompletedAtom.reportObserved();
    return super.isCompleted;
  }

  @override
  set isCompleted(bool value) {
    _$isCompletedAtom.context.conditionallyRunInAction(() {
      super.isCompleted = value;
      _$isCompletedAtom.reportChanged();
    }, _$isCompletedAtom, name: '${_$isCompletedAtom.name}_set');
  }

  final _$_TodoActionController = ActionController(name: '_Todo');

  @override
  dynamic toggleCompleted([bool b]) {
    final _$actionInfo = _$_TodoActionController.startAction();
    try {
      return super.toggleCompleted(b);
    } finally {
      _$_TodoActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTitle(String v) {
    final _$actionInfo = _$_TodoActionController.startAction();
    try {
      return super.setTitle(v);
    } finally {
      _$_TodoActionController.endAction(_$actionInfo);
    }
  }
}
