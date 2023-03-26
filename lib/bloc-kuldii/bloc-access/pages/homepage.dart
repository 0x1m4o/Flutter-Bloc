import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../pages/userpage.dart';
import '../bloc-provider/data_widget.dart';

class HomePage extends StatelessWidget {
  static const nameRoute = '/homepage';
  @override
  Widget build(BuildContext context) {
    /// Named Route
    // Counter counter = context.read<Counter>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Homepage'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /// Anonymous Route
          // Karena kita sebelumnya hanya membungkus scaffold homepage(). Kita harus melempar atau mengirim value dari provider scaffold sebelumnya ke dalam scaffold baru yaitu userpage()
          // Navigator.of(context).push(MaterialPageRoute(
          //     builder: (context) => BlocProvider.value(
          //           value: counter,
          //           child: UserPage(),
          //         )
          //     // UserPage(),
          //     ));

          /// Named Route and Generated Route
          // Navigator.of(context).pushNamed(UserPage.nameRoute);

          /// Global Route
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => UserPage(),
          ));
        },
        child: const Icon(Icons.navigate_next),
      ),
      body: const DataWidget(),
    );
  }
}
