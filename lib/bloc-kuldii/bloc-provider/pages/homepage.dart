import 'package:flutter/material.dart';
import '../bloc-provider/data_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DataWidget(),
    );
  }
}
