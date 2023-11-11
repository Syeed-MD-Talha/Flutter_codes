import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HeroAnimation(),
    );
  }
}

class HeroAnimation extends StatelessWidget {
  const HeroAnimation({Key? key});

  @override
  Widget build(BuildContext context) {
    timeDilation = 15.0;
    return Scaffold(
      appBar: AppBar(
        title: Text('Basic Hero Animation'),
      ),
      body: Center(
        child: PhotoHero(
          photo: 'assets/net.jpg',
          width: 300,
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return Scaffold(
                  appBar: AppBar(
                    title: Text('Flippers Page'),
                  ),
                  body: Container(
                    color: Colors.lightBlueAccent,
                    padding: EdgeInsets.all(16),
                    alignment: Alignment.topLeft,
                    child: PhotoHero(
                      photo: 'assets/net.jpg',
                      width: 100.0,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                );
              },
            ));
          },
        ),
      ),
    );
  }
}

class PhotoHero extends StatelessWidget {
  PhotoHero({Key? key, required this.photo, this.onTap, required this.width});

  final String photo;
  final VoidCallback? onTap;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: photo,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                photo,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
