import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ProviderExample());
}

class LeftCount extends ChangeNotifier { //........... Creating class with  ChangeNotifier............
  int _count = 0;

  int get count => _count;

  void onChange() {
    _count++;
    notifyListeners();   //.........  which works like  SetState(){} ...........
  }
}

class RightCount with ChangeNotifier {
  int _count = 0;
  int get count => _count;
  void OnChange() {
    _count++;
    notifyListeners();
  }
}

class ProviderExample extends StatelessWidget {
  const ProviderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(                //.................... MultiProvider.........................
      providers: [
        ChangeNotifierProvider(
          create: (context) => LeftCount(),
        ),
        ChangeNotifierProvider(             //.............. These are the starting point of Provider.....
          create: (context) => RightCount(),
        )
      ],
      child: MaterialApp(
        title: 'Provider Demo',
        theme: ThemeData(primarySwatch: Colors.amber),
        home: PageOne(),
      ),
    );
  }
}

class PageOne extends StatelessWidget {
  PageOne({super.key});
  int cnt = 0;

  @override
  Widget build(BuildContext context) {
    print('...talha... $cnt');
    cnt++;
    final ProviderRight = Provider.of<RightCount>(context, listen: false);   //.........Creating instance.....
    final ProviderLeft = Provider.of<LeftCount>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Demo'),
      ),
      body: Row(
        children: [
          SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer<LeftCount>( // ********************** Most Important Part ****************
                builder: (context, value, child) => Text(
                  //'$ProviderLeft.count',
                  ProviderLeft.count.toString(),  //................... Provider value....
                  style: TextStyle(fontSize: 60),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    ProviderLeft.onChange(); //........... Calling class method...............
                  },
                  child: Icon(Icons.add))
            ],
          ),
          SizedBox(
            width: 200,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer<RightCount>(  // ********************** Most Important Part ****************
                builder: (context, value, child) => Text(
                  //'$ProviderRight.count',
                  ProviderRight.count.toString(),
                  style: TextStyle(fontSize: 60),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    ProviderRight.OnChange();
                  },
                  child: Container(
                    color: Colors.red,
                    child: Icon(
                      Icons.add,
                    ),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
