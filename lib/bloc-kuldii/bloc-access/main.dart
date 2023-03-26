import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './pages/homepage.dart'; // Named Route, Anonymous Route, Generated Route, Global Route
// import './pages/userpage.dart'; // Named Route
import './bloc/counter.dart';
// import 'package:flutter_bloc/flutter_bloc.dart'; // Named Route and Anonymous Route
// import '../bloc-access/routes/route.dart'; // Generated
// import './bloc-access/pages/not_found.dart'; // Generated

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  /// final router = MyRoute(); // Generated Route
  @override
  Widget build(BuildContext context) {
    // Counter myCounter = Counter(); // Named Route

    /// Anonymous Route
    // Kita menurunkan BlocProvider agar membungkus scaffold homepagenya saja bukan materialappnya.
    // return MaterialApp(
    //     home: BlocProvider(
    //   create: (context) => Counter(),
    //   child: HomePage(),
    // ));

    /// Named Route
    // return MaterialApp(
    //   initialRoute: HomePage.nameRoute,
    //   routes: {
    //     HomePage.nameRoute: (context) => BlocProvider.value(
    //           value: myCounter,
    //           child: HomePage(),
    //         ),
    //     UserPage.nameRoute: (context) => BlocProvider.value(
    //           value: myCounter,
    //           child: UserPage(),
    //         )
    //   },
    // );

    /// Generated Route
    // return MaterialApp(
    //   onGenerateRoute: (settings) => router.onRoute(settings),
    //   initialRoute: HomePage.nameRoute,
    // );

    /// Global Route
    return BlocProvider(
      create: (context) => Counter(),
      child: MaterialApp(home: HomePage()),
    );
  }
}
