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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProviderSlider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProviderHeight(),
        )
      ],
      child: MaterialApp(
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
    final providerH = Provider.of<ProviderHeight>(context, listen: false);
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
            builder: (context, value, child) => Consumer<ProviderHeight>(
              builder: (context, height, child) => Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        providerH.Increase();
                      },
                      child: Container(
                        height: height.height,
                        color: Colors.cyan.withOpacity(value.value),
                        child: Center(child: Text('Container 1')),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        providerH.Decrase();
                      },
                      child: Container(
                        height: height.height,
                        color: Colors.pink.withOpacity(value.value),
                        child: Center(child: Text('Container 1')),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ProviderSlider with ChangeNotifier {
  // ignore: prefer_final_fields
  double _value = 0.1;
  double get value => _value;

  set changeState(newValue) {
    _value = newValue;
    notifyListeners();
  }
}

class ProviderHeight with ChangeNotifier {
  double _height = 100;
  double get height => _height;
  void Increase() {
    _height < 500 ? _height += 100 : _height = 100;
    notifyListeners();
  }

  void Decrase() {
    _height > 100 ? _height -= 100 : _height = 100;
    notifyListeners();
  }
}
