import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class CounterCubit extends Cubit {
  CounterCubit({this.initialData = 0}) : super(initialData);

  int initialData;

  int? current;
  int? next;

  void removeData() {
    if (state != 0) {
      emit(state - 1);
    }
  }

  void addData() {
    emit(state + 1);
  }

  @override
  void onChange(Change change) {
    print(change);
    current = change.currentState;
    next = change.nextState;
    super.onChange(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print(error);
    super.onError(error, stackTrace);
  }
}

class HomePage extends StatelessWidget {
  CounterCubit myCounter = CounterCubit(/** initialData = 69 */);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cubit Apps '),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        StreamBuilder(
          initialData: myCounter.initialData,
          stream: myCounter.stream,
          builder: (context, snapshot) {
            return Column(
              children: [
                Center(
                  child: Text(
                    '${snapshot.data}',
                    style: TextStyle(fontSize: 35),
                  ),
                ),
                Center(
                  child: Text(
                    'Current : ${myCounter.current}',
                    style: TextStyle(fontSize: 35),
                  ),
                ),
                Center(
                  child: Text(
                    'Next : ${myCounter.next}',
                    style: TextStyle(fontSize: 35),
                  ),
                ),
              ],
            );
          },
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          OutlinedButton(
              onPressed: () {
                myCounter.removeData();
              },
              child: Icon(Icons.remove)),
          OutlinedButton(
              onPressed: () {
                myCounter.addData();
              },
              child: Icon(Icons.add))
        ])
      ]),
    );
  }
}
