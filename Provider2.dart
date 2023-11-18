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
    return ChangeNotifierProvider(
      create: (context) => ProviderSlider(),
      builder: (context, child) => MaterialApp(
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProviderSlider>(context, listen: false);
    cnt++;
    print('build no. $cnt');
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Slider Example with Provider')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<ProviderSlider>(
            builder: (context, value, child) => Slider(
              value: value.value,
              min: 0.0,
              max: 1.0,
              onChanged: (value) {
                provider.changeState = value;
              },
            ),
          ),
          Consumer<ProviderSlider>(
            builder: (context, value, child) => Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    color: Colors.cyan.withOpacity(value.value),
                    child: Center(child: Text('Container 1')),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    color: Colors.pink.withOpacity(value.value),
                    child: Center(child: Text('Container 1')),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ProviderSlider with ChangeNotifier {
  double _value = 0.1;
  double get value => _value;

  set changeState(newValue) {
    _value = newValue;
    notifyListeners();
  }
}

class Provider_height with ChangeNotifier {
  int _height = 100;
  int get height => _height;

  void onChange() {
    _height += 100;
    notifyListeners();
  }
}
