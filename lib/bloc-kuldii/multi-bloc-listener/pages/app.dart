import 'package:flutter/material.dart';
import '../bloc/theme.dart';
import './homepage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, bool>(
      builder: (context, state) {
        return MaterialApp(
          theme: state == true ? ThemeData.light() : ThemeData.dark(),
          home: HomePage(),
        );
      },
      bloc: context.read<ThemeBloc>(),
    );
  }
}
