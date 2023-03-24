import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Stream<int> countStream() async* {
    int counter = int.parse(myController.text);
    for (int i = counter; i >= 0; i--) {
      await Future.delayed(Duration(seconds: 1));
      yield i;
    }
  }

  void _showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Waktumu Telah Habis'),
      ),
    );
  }

  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stream App (Timer Apps)'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            myController.clear();
          });
        },
        child: Icon(Icons.restore),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
        children: [
          if (myController.text.isNotEmpty &&
              int.tryParse(myController.text) != null)
            StreamBuilder<int>(
              stream: countStream(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.connectionState != ConnectionState.done) {
                  return Center(
                      child: Text(
                    '${snapshot.data}',
                    style: TextStyle(fontSize: 35),
                  ));
                } else {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    _showSnackBar(context);
                  });
                  return Center(child: Text('Done'));
                }
              },
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    height: 60,
                    child: TextFormField(
                        controller: myController,
                        decoration: InputDecoration(
                          labelText: "Timer",
                        )),
                  ),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            myController.text;
                          });
                        },
                        child: Text('Submit')),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
