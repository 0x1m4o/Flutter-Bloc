import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/counter.dart';

class DataWidget extends StatelessWidget {
  const DataWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Counter myCounter = BlocProvider.of<Counter>(context);
    return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      BlocConsumer<Counter, int>(
        bloc: myCounter,
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Material(
                borderRadius: BorderRadius.circular(15),
                color: Colors.blue,
                child: InkWell(
                  onTap: () {
                    myCounter.kurangData();
                  },
                  borderRadius: BorderRadius.circular(15),
                  child: SizedBox(
                      height: 100,
                      width: 70,
                      child: Center(
                        child: Icon(Icons.remove),
                      )),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  width: 200,
                  height: 100,
                  color: Colors.grey,
                  child: Center(
                    child: Text(
                      '$state',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
              ),
              Material(
                borderRadius: BorderRadius.circular(15),
                color: Colors.blue,
                child: InkWell(
                  onTap: () {
                    myCounter.tambahData();
                  },
                  borderRadius: BorderRadius.circular(15),
                  child: SizedBox(
                      height: 100,
                      width: 70,
                      child: Center(
                        child: Icon(Icons.add),
                      )),
                ),
              )
            ],
          );
        },
        listener: (context, state) {
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
    ]));
  }
}
