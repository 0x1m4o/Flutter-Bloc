import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './pages/homepage.dart';
import './bloc/counter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Kita menurunkan BlocProvider agar membungkus scaffold homepagenya saja bukan materialappnya.
    return MaterialApp(
        home: BlocProvider(
      create: (context) => Counter(),
      child: HomePage(),
    ));
  }
}
