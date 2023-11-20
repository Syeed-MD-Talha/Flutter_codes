import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Myapp());
}

int cnt = 0;

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.red),
      ),
      home: NotifyListenerScreen(),
    );
  }
}

// ignore: must_be_immutable
class NotifyListenerScreen extends StatelessWidget {
  NotifyListenerScreen({super.key});

  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  ValueNotifier<bool> toggle = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    print('talha');
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Subscribe')),
      ),
      body: Column(children: [
        ValueListenableBuilder(
          valueListenable: toggle,
          builder: (context, value, child) => TextFormField(
            obscureText: toggle.value,
            decoration: InputDecoration(
                hintText: 'Password',
                suffix: InkWell(
                  child: Icon(toggle.value
                      ? Icons.visibility
                      : Icons.visibility_off_outlined),
                  onTap: () {
                    toggle.value = !toggle.value;
                    cnt++;
                    print('talha $cnt');
                  },
                )),
          ),
        ),
        Center(
          child: ValueListenableBuilder(
            valueListenable: _counter,
            builder: (context, value, child) => Text(
              'Subscribe ' + _counter.value.toString(),
              style: TextStyle(fontSize: 50),
            ),
          ),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter.value++;
        },
        child: Icon(
          Icons.add,
          color: Colors.red,
        ),
        backgroundColor: Colors.cyan,
      ),
    );
  }
}
