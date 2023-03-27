import 'package:flutter/material.dart';
import '../bloc/userBloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserBloc user = context.read<UserBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // BlocBuilder<UserBloc, Map<String, dynamic>>(
            //   builder: (context, state) {
            //     return Text('Nama : ${state["name"]}');
            //   },
            // ),
            BlocSelector<UserBloc, Map<String, dynamic>, String>(
              selector: (state) => state["name"],
              builder: (context, state) {
                return Text('Nama : ${state}');
              },
            ),
            Container(
              width: double.infinity,
              height: 50,
              child: TextField(
                onChanged: (value) {
                  return user.newUser(value);
                },
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            // BlocBuilder<UserBloc, Map<String, dynamic>>(
            //   builder: (context, state) {
            //     return Text('Umur : ${state["age"]}');
            //   },
            // ),

            BlocSelector<UserBloc, Map<String, dynamic>, int>(
              selector: (state) => state["age"],
              builder: (context, state) {
                return Text('Age : ${state}');
              },
            ),
            Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      user.newAge(user.state["age"] - 1);
                    },
                    icon: const Icon(Icons.remove),
                  ),
                  IconButton(
                    onPressed: () {
                      user.newAge(user.state["age"] + 1);
                    },
                    icon: const Icon(Icons.add),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
