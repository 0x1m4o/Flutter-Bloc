import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../pages/not_found.dart';
import '../pages/homepage.dart';
import '../pages/userpage.dart';
import '../bloc/counter.dart';

class MyRoute {
  Counter counter = Counter();
  Route onRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomePage.nameRoute:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider.value(
              value: counter,
              child: HomePage(),
            );
          },
        );
      case UserPage.nameRoute:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider.value(
              value: counter,
              child: UserPage(),
            );
          },
        );
      default:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider.value(
              value: counter,
              child: const NotFound(),
            );
          },
        );
    }
  }
}
