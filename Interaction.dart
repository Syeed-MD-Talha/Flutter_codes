import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// TapboxA manages its own state.

//------------------------- TapboxA ----------------------------------

// ignore: must_be_immutable
class TapboxA extends StatefulWidget {
  bool Active;
  ValueChanged<bool> changed;
  TapboxA({super.key, this.Active = false, required this.changed});

  @override
  State<TapboxA> createState() => _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {
  void OnChange() {
    widget.changed(!widget.Active);
  }

  bool border = true;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        setState(() {
          border = !border;
        });
      },
      onTap: OnChange,
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: widget.Active
              ? const Color.fromARGB(255, 56, 132, 159)
              : Colors.grey[600],
          border: border
              ? Border.all(
                  style: BorderStyle.solid,
                  color: Colors.red,
                  width: 5,
                )
              : null,
        ),
        child: Center(
          child: Text(
            widget.Active ? 'Active' : 'Inactive',
            style: const TextStyle(fontSize: 32, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

// class TapboxA extends StatefulWidget {
//   const TapboxA({super.key});

//   @override
//   State<TapboxA> createState() => _TapboxAState();
// }

// class _TapboxAState extends State<TapboxA> {
//   bool _active = false;

//   void _handleTap() {
//     setState(() {
//       _active = !_active;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: _handleTap,
//       child: Container(
//         width: 200,
//         height: 200,
//         decoration: BoxDecoration(
//           color: _active ? Colors.lightGreen[700] : Colors.grey[600],
//         ),
//         child: Center(
//           child: Text(
//             _active ? 'Active' : 'Inactive',
//             style: const TextStyle(fontSize: 32, color: Colors.white),
//           ),
//         ),
//       ),
//     );
//   }
// }

//------------------------- MyApp ----------------------------------

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool active = false;
  void Change(bool Newvalue) {
    setState(() {
      active = Newvalue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Demo'),
        ),
        body: Center(
          child: TapboxA(
            Active: active,
            changed: Change,
          ),
        ),
      ),
    );
  }
}
