import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:todo/bloc/todo_bloc_app.dart';
import 'package:todo/mobx/todo_app.dart';
import 'package:todo/redux/todo_redux_app.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(tabs: [
                Tab(text: 'mobx'),
                Tab(text: 'redux'),
                Tab(text: 'bloc'),
              ]),
            ),
            body: TabBarView(children: <Widget>[
              TodoApp(),
              aReduxApp,
              TodoBlocApp(),
            ],),
          ),
        ));
  }
}
//
//class ReduxApp extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return  StoreProvider() MaterialApp(
//        title: 'Flutter Demo',
//        theme: ThemeData(
//          // This is the theme of your application.
//          //
//          // Try running your application with "flutter run". You'll see the
//          // application has a blue toolbar. Then, without quitting the app, try
//          // changing the primarySwatch below to Colors.green and then invoke
//          // "hot reload" (press "r" in the console where you ran "flutter run",
//          // or simply save your changes to "hot reload" in a Flutter IDE).
//          // Notice that the counter didn't reset back to zero; the application
//          // is not restarted.
//          primarySwatch: Colors.blue,
//        ),
//        home: DefaultTabController(
//          length: 2,
//          child: Scaffold(
//            appBar: AppBar(
//              bottom: TabBar(tabs: [
//                Tab(text: 'mobx'),
//                Tab(text: 'redux'),
//              ]),
//            ),
//            body: TabBarView(children: <Widget>[
//              TodoApp(),
//              aReduxApp,
//            ],),
//          ),
//        ));
//  }
//}
