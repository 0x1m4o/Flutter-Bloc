import 'package:flutter/material.dart';
import '../bloc/userBloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserBloc myUser = context.read<UserBloc>();
    // String user =
    //     context.select<UserBloc, String>((value) => value.state["name"]);
    // int age = context.select<UserBloc, int>((value) => value.state["age"]);
    print('Build Scaffold');
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
            // BlocSelector<UserBloc, Map<String, dynamic>, String>(
            //   selector: (state) => state["name"],
            //   builder: (context, state) {
            //     return Text('Nama : ${state}');
            //   },
            // ),

            // Builder(builder: (context) {
            //   print('Build Name');
            //   UserBloc user = context.watch<UserBloc>();
            //   return Text('Nama : ${user.state["name"]}');
            // }),
            Builder(builder: (context) {
              print(
                  'Build Name is only run if the context or state in this builder change');
              String userName = context.select<UserBloc, String>(
                (value) => value.state['name'],
              );
              return Text('Nama : $userName');
            }),
            Container(
              width: double.infinity,
              height: 50,
              child: TextField(
                onChanged: (value) {
                  return myUser.newUser(value);
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

            // BlocSelector<UserBloc, Map<String, dynamic>, int>(
            //   selector: (state) => state["age"],
            //   builder: (context, state) {
            //     return Text('Age : ${state}');
            //   },
            // ),
            Builder(builder: (context) {
              print(
                  'Build Age is only run if the context or state in this builder change');
              int userAge = context.select<UserBloc, int>(
                (value) => value.state['age'],
              );
              return Text('Age : $userAge');
            }),
            Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      myUser.newAge(myUser.state["age"] - 1);
                    },
                    icon: const Icon(Icons.remove),
                  ),
                  IconButton(
                    onPressed: () {
                      myUser.newAge(myUser.state["age"] + 1);
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
