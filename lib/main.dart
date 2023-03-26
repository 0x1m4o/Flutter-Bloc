import 'package:flutter/material.dart';
import 'package:learning_flutter_bloc/multi-bloc-listener/bloc/theme.dart';
import 'multi-bloc-listener/bloc/counter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'multi-bloc-listener/pages/app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// Single Bloc Provider is complicated for multiple use
    // return BlocProvider(
    //   create: (context) => myTheme,
    //   child: BlocBuilder<ThemeBloc, bool>(
    //     builder: (context, state) {
    //       return MaterialApp(
    //           theme: state == true ? ThemeData.light() : ThemeData.dark(),
    //           home: BlocProvider(
    //             create: (context) => Counter(),
    //             child: HomePage(),
    //           ));
    //     },
    //     bloc: myTheme,
    //   ),
    // );

    /// Multiple Bloc Provier
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeBloc(),
        ),
        BlocProvider(
          create: (context) => Counter(),
        )
      ],
      child: App(),
    );
  }
}