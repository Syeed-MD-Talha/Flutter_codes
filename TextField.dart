import 'package:flutter/material.dart';

void main() => runApp(HomePage());

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Talha is a good boy',
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final items = List<String>.generate(20, (index) => 'Item ${index}');

  final myController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: TextField(
            controller: myController,
            decoration: InputDecoration(
                hintText: 'Enter your name', border: OutlineInputBorder()),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(myController.text);
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(content: Text(myController.text));
            },
          );
        },
        child: Icon(Icons.text_fields),
      ),
    );
  }
}
