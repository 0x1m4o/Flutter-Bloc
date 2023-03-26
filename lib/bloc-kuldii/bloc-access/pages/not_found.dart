import 'package:flutter/material.dart';

class NotFound extends StatelessWidget {
  static const nameRoute = 'not-found';
  const NotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [Text('Not Found (404)')],
        ),
      ),
    );
  }
}
