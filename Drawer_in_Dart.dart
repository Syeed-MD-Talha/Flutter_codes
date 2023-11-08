import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Returning Data',
      home: HomeScreen(),
    ),
  );
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectIndex = 0;

  TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void onChange(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOption = [
      Center(
        child: Container(
          width: 300,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.all(
                Radius.circular(15)), // 100 is half of 200 for a circular shape
            border: Border.all(color: Colors.black, width: 4),
          ),
          padding: EdgeInsets.all(2.0),
          child: Center(
            child: Text(
              'This is Home Page',
              style: optionStyle,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
      Center(
        child: Container(
          height: 300,
          width: 340,
          decoration: BoxDecoration(
              color: Colors.amber[400],
              borderRadius: BorderRadius.all(Radius.circular(22)),
              border: Border.all(color: Colors.red, width: 3)),
          child: Center(
            child: Text(
              'This is Business Page',
              style: optionStyle,
            ),
          ),
        ),
      ),
      Center(
        child: Container(
          width: 300,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.pink,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(35),
            ), // 100 is half of 200 for a circular shape
            border: Border.all(color: Colors.black, width: 3),
            boxShadow: [
              BoxShadow(
                color: Colors.grey, // shadow color
                offset: Offset(-2, 3), // shadow offset from the top-left corner
                blurRadius: 20, // shadow blur radius
                spreadRadius: 10, // spread radius
              ),
            ],
          ),
          padding: EdgeInsets.all(2.0),
          child: Center(
            child: Text(
              'This is School Page',
              style: optionStyle,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),

      // Center(
      //   child: Container(
      //     width: 200,
      //     height: 200,
      //     // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      //     padding: EdgeInsets.all(10.0),
      //     color: Colors.red,
      //     child: Center(
      //       child: Text(
      //         'This is School Page',
      //         style: optionStyle,
      //         textAlign: TextAlign.center,
      //       ),
      //     ),
      //   ),
      // ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Returning Data Demo'),
      ),
      body: _widgetOption[_selectIndex],
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 114, 175, 143)),
                child: Center(
                  child: Text(
                    'Drawer Header',
                    style: TextStyle(fontSize: 20),
                  ),
                )),
            Center(
              child: ListTile(
                title: Center(child: Text('Home')),
                selected: _selectIndex == 0,
                //tileColor: Colors.amber,
                contentPadding: EdgeInsets.all(10),
                onTap: () {
                  onChange(0);
                  Navigator.pop(context);
                },
              ),
            ),
            ListTile(
              title: Center(child: Text('Business')),
              selected: _selectIndex == 1,
              //tileColor: Colors.cyan,
              contentPadding: EdgeInsets.all(10),
              onTap: () {
                onChange(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Center(child: Text('School')),
              selected: _selectIndex == 2,
              //tileColor: Colors.cyan,
              contentPadding: EdgeInsets.all(10),
              onTap: () {
                onChange(2);
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
