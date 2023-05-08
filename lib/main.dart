import 'package:flutter/material.dart';
import 'extension-method/pages/homepage.dart';
import 'extension-method/bloc/userBloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => UserBloc(),
        child: HomePage(),
      ),
    );
  }
}
