import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter.dart';

class HomePage extends StatelessWidget {
  Counter myCounter = Counter(/** initialData = 69 */);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Observer Cubit Apps '),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        BlocBuilder<Counter, int>(
          builder: (context, state) {
            return Column(
              children: [
                Center(
                  child: Text(
                    '$state',
                    style: TextStyle(fontSize: 35),
                  ),
                ),
              ],
            );
          },
          bloc: myCounter,
          buildWhen: (previous, current) {
            if (current % 2 == 0) {
              return true;
            } else {
              return false;
            }
          },
        ),
        // StreamBuilder(
        //   initialData: myCounter.initialData,
        //   stream: myCounter.stream,
        //   builder: (context, snapshot) {
        //     return Column(
        //       children: [
        //         Center(
        //           child: Text(
        //             '${snapshot.data}',
        //             style: TextStyle(fontSize: 35),
        //           ),
        //         ),
        //         Center(
        //           child: Text(
        //             'Current : ${myCounter.current}',
        //             style: TextStyle(fontSize: 35),
        //           ),
        //         ),
        //         Center(
        //           child: Text(
        //             'Next : ${myCounter.next}',
        //             style: TextStyle(fontSize: 35),
        //           ),
        //         ),
        //       ],
        //     );
        //   },
        // ),
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

// END