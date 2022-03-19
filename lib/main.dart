import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

Widget Contain(double height, Widget child, Color color) {
  return Container(
    width: 200,
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
    //red = 0xFFF44336
    //pink = 0xFFE91E63
    //purple = 0xFF9C27B0
    // blue = 0xFF2196F3
    //green = 0xFF4CAF50
    List<String> questions = [
      'Is that color blue?',
      'Is that color red?',
      'Is that color green?',
      'Is that color pink?',
      'Is that color purple?'
    ];
    Color _randomColor =
        Colors.primaries[Random().nextInt(Colors.primaries.length)];

    Color colors = _randomColor;
    void _rcTap() {
      setState(() {
        colors = _randomColor;
      });
    }

    String Test(Color color) {
      if (colors.toString() == '0xFFF44336') {
        return 'Red';
      } else {
        return 'No red';
      }
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('First App'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: _rcTap,
                  child: Contain(200, Text('1'), colors),
                ),
              ],
            ),
            Text(questions[Random().nextInt(4)]),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {                    
                  },
                  child: Text(
                    'Yes',
                    style: TextStyle(
                      color: colors,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'No',
                    style: TextStyle(
                      color: colors,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
