import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Page1(),
  ));
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Talha is a good boy')),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(context, _createRoute());
              //Navigator.of(context).push(_createRoute());
            },
            child: Text('Go')),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Page2(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0, 1);
        const end = Offset.zero;
        var curve = Curves.ease;
        //final tween = Tween(begin: begin, end: end);
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        final offsetAnimation = animation.drive(tween);

        var curveTween = CurveTween(curve: curve);
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      });
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('This is 2nd Page'),
      ),
      body: Center(
        child: Container(width: 300, height: 300, color: Colors.green),
      ),
    );
  }
}
