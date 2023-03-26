import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_flutter_bloc/bloc-provider-value/pages/userpage.dart';
import '../bloc/counter.dart';
import '../bloc-provider/data_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Counter counter = context.read<Counter>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Homepage'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Karena kita sebelumnya hanya membungkus scaffold homepage(). Kita harus melempar atau mengirim value dari provider scaffold sebelumnya ke dalam scaffold baru yaitu userpage()
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => BlocProvider.value(
                    value: counter,
                    child: UserPage(),
                  )
              // UserPage(),
              ));
        },
        child: Icon(Icons.navigate_next),
      ),
      body: DataWidget(),
    );
  }
}
