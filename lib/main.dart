import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

Widget Contain(double height, Widget child, Color color) {
  return Container(
    child: child,
    height: height,
    color: color,
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    Color _randomColor =
        Colors.primaries[Random().nextInt(Colors.primaries.length)];

    Color colors = _randomColor;
    void _rcTap() {
      setState(() {
        colors = _randomColor;
      });
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('First App'),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: InkWell(
                    onTap: _rcTap,
                    child: Contain(200, Text('1'), colors),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Contain(200, Text('2'), colors),
                ),
                Expanded(
                  flex: 1,
                  child: Contain(200, Text('3'), colors),
                ),
              ],
            ),            
          ],
        ),
      ),
    );
  }
}
