import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/theme.dart';
import '../bloc/counter.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final myCounter = context.read<Counter>();
    final myTheme = context.read<ThemeBloc>();
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      myCounter.removeData();
                    },
                    icon: Icon(Icons.remove)),
                BlocBuilder<Counter, int>(
                  bloc: myCounter,
                  builder: (context, state) {
                    return Text(
                      '$state',
                      style: TextStyle(fontSize: 40),
                    );
                  },
                ),
                IconButton(
                    onPressed: () {
                      myCounter.addData();
                    },
                    icon: Icon(Icons.add)),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          myTheme.changeData();
        },
        child: Icon(Icons.nightlight_round_outlined),
      ),
    );
  }
}
