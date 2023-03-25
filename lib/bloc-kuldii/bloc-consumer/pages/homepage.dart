import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/counter.dart';

class HomePage extends StatelessWidget {
  Counter myCounter = Counter();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        BlocConsumer<Counter, int>(
          bloc: myCounter,
          builder: (context, state) {
            return Text(
              '$state',
              style: TextStyle(fontSize: 35),
            );
          },
          listener: (context, state) {
            print(state);
            print('Next ${myCounter.next}');
            print(myCounter.current);
            if (myCounter.next! >= 10) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  duration: Duration(milliseconds: 500),
                  content: Text('Sudah mencapai batas harian pembelian')));
            } else {
              if (state == myCounter.current! - 1) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    duration: Duration(milliseconds: 500),
                    content: Text('Berhasil Di Kurangkan')));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    duration: Duration(milliseconds: 500),
                    content: Text('Berhasil Di Tambahkan')));
              }
            }
          },
          // listenWhen: (previous, current) {
          //   if (current % 2 == 0) {
          //     return true;
          //   }
          // },
          buildWhen: (previous, current) {
            if (current > 10) {
              return false;
            } else {
              return true;
            }
          },
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {
                  myCounter.kurangData();
                },
                icon: Icon(Icons.remove)),
            IconButton(
                onPressed: () {
                  myCounter.tambahData();
                },
                icon: Icon(Icons.add))
          ],
        )
      ])),
    );
  }
}
