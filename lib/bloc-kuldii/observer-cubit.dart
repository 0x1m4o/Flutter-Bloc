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

  void removeData() {
    if (state != 0) {
      emit(state - 1);
    }
  }

  void addData() {
    emit(state + 1);
  }
}

class HomePage extends StatelessWidget {
  CounterCubit myCounter = CounterCubit(/** initialData = 69 */);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Observer Cubit Apps '),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        StreamBuilder(
          initialData: myCounter.initialData,
          stream: myCounter.stream,
          builder: (context, snapshot) {
            return Center(
              child: Text(
                '${snapshot.data}',
                style: TextStyle(fontSize: 35),
              ),
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
