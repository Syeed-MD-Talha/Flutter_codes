import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class IncrementIntent extends Intent {
  IncrementIntent();
}

class DecrementIntent extends Intent {
  DecrementIntent();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text Field Focus',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Snakbar Demo'),
          ),
          body: Keyboard()),
    );
  }
}

class Keyboard extends StatefulWidget {
  const Keyboard({super.key});

  @override
  State<Keyboard> createState() => _KeyboardState();
}

class _KeyboardState extends State<Keyboard> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Shortcuts(
        shortcuts: <ShortcutActivator, Intent>{
          LogicalKeySet(LogicalKeyboardKey.arrowUp): IncrementIntent(),
          LogicalKeySet(LogicalKeyboardKey.arrowDown): DecrementIntent()
        },
        child: Actions(
            actions: {
              IncrementIntent: CallbackAction(
                onInvoke: (intent) {
                  setState(() {
                    count++;
                  });
                },
              ),
              DecrementIntent: CallbackAction(
                onInvoke: (intent) {
                  setState(() {
                    count--;
                  });
                },
              ),
            },
            child: Focus(
                child: Center(
              child: Text(
                'Counter: $count',
                style: TextStyle(fontSize: 30),
              ),
            ))));
  }
}
