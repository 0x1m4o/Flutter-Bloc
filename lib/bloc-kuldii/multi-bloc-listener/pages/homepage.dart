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
      appBar: AppBar(title: const Text('Home Page')),
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
                    icon: const Icon(Icons.remove)),

                /// Listener single bloc sangat rumit dan berantakan
                // BlocListener<ThemeBloc, bool>(
                //   listener: (context, state) {
                //     ScaffoldMessenger.of(context).showSnackBar(
                //         const SnackBar(content: Text('Mode Gelap aktif')));
                //   },
                //   listenWhen: (previous, current) {
                //     if (current == false) {
                //       return true;
                //     } else {
                //       return false;
                //     }
                //   },
                //   child: BlocListener<Counter, int>(
                //     listener: (context, state) {
                //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                //           content: Text('Telah mencapai batas harian')));
                //     },
                //     listenWhen: (previous, current) {
                //       if (current == 10) {
                //         return true;
                //       } else {
                //         return false;
                //       }
                //     },
                //     child: BlocBuilder<Counter, int>(
                //       bloc: myCounter,
                //       builder: (context, state) {
                //         return Text(
                //           '$state',
                //           style: const TextStyle(fontSize: 40),
                //         );
                //       },
                //     ),
                //   ),
                // ),

                /// Multi bloc listener
                MultiBlocListener(
                  listeners: [
                    BlocListener<ThemeBloc, bool>(
                      listener: (context, state) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Mode Gelap aktif')));
                      },
                      listenWhen: (previous, current) {
                        if (current == false) {
                          return true;
                        } else {
                          return false;
                        }
                      },
                    ),
                    BlocListener<Counter, int>(
                      listener: (context, state) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Telah mencapai batas harian')));
                      },
                      listenWhen: (previous, current) {
                        if (current == 10) {
                          return true;
                        } else {
                          return false;
                        }
                      },
                    )
                  ],
                  child: BlocBuilder<Counter, int>(
                    bloc: myCounter,
                    builder: (context, state) {
                      return Text(
                        '$state',
                        style: const TextStyle(fontSize: 40),
                      );
                    },
                  ),
                ),
                IconButton(
                    onPressed: () {
                      myCounter.addData();
                    },
                    icon: const Icon(Icons.add)),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          myTheme.changeData();
        },
        child: const Icon(Icons.nightlight_round_outlined),
      ),
    );
  }
}
