import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/counter.dart';

class UserPage extends StatelessWidget {
  static const nameRoute = '/user-page';

  const UserPage({super.key});
  @override
  Widget build(BuildContext context) {
    Counter counter = context.read<Counter>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Page'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          BlocBuilder(
            builder: (context, state) {
              return Text(
                '$state',
                style: const TextStyle(fontSize: 40),
              );
            },
            bloc: counter,
          )
        ]),
      ),
    );
  }
}
