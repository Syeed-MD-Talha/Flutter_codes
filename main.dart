// Copyright 2019 the Dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license
// that can be found in the LICENSE file.

import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerApp extends StatefulWidget {
  const AnimatedContainerApp({super.key});

  @override
  State<AnimatedContainerApp> createState() => _AnimatedContainerAppState();
}


class _AnimatedContainerAppState extends State<AnimatedContainerApp> {
  double _width = 50;
  double _height = 50;
  Color _color = Colors.deepPurpleAccent;
  BorderRadius _borderRadius = BorderRadius.circular(8);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation Demo'),
      ),
      body: Center(
        child: AnimatedContainer(
          width: _width,
          height: _height,
          decoration: BoxDecoration(color: _color, borderRadius: _borderRadius),
          duration: Duration(seconds: 2),
          curve: Curves.fastOutSlowIn,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            final random = Random();

            _width = random.nextInt(300).toDouble();
            _height = random.nextInt(300).toDouble();

            _color = Color.fromRGBO(random.nextInt(256), random.nextInt(256),
                random.nextInt(256),
                 random.nextDouble()
                );
            _borderRadius =
                BorderRadius.circular(random.nextInt(100).toDouble());
          });
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MaterialApp(
        home: AnimatedContainerApp(),
      ),
    );
  }
}

void main() {
  runApp(
    const MyApp(),
  );
}
