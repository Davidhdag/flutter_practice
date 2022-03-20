import 'dart:math';
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
    Map<String, String> colorMap = {
      'blue': '4280391411',
      'red': '4294198070',
      'green': '4283215696',
      'pink': '4293467747',
      'purple': '4288423856',
    };
    List cList = colorMap.keys.toList();

    Color _randomColor =
        Colors.primaries[Random().nextInt(Colors.primaries.length)];

    Color colors = _randomColor;
    void _rcTap() {
      setState(() {
        colors = _randomColor;
      });
    }

    String colorList = cList[Random().nextInt(4)];

    bool Test(Color color) {
      if (colorMap['${colorList}'] == colors.value.toString()) {
        return true;
      } else {
        return false;
      }
    }

    // Future<void> _showDialog() async {
    //   await showDialog(
    //     context: context,
    //     builder: (ctx) => AlertDialog(
    //       title: Text('Are you sure?'),
    //       content: Text('Is that color realy $colorList?'),
    //       actions: [
    //         TextButton(
    //           onPressed: () {
    //             Navigator.of(context).pop();
    //           },
    //           child: Text(
    //             'Yes',
    //             style: TextStyle(color: colors),
    //           ),
    //         ),
    //         TextButton(
    //           onPressed: () {
    //             Navigator.of(context).pop();
    //           },
    //           child: Text(
    //             'No',
    //             style: TextStyle(color: colors),
    //           ),
    //         ),
    //       ],
    //     ),
    //   );
    // }

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
                  child: Contain(200, Text(colorList), colors),
                ),
              ],
            ),
            Text('Is that color $colorList?'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  child: Text(
                    'Yes',
                    style: TextStyle(
                      color: colors,
                    ),
                  ),
                  onPressed: () {
                    // _showDialog();
                  },
                ),
                TextButton(
                  child: Text(
                    'No',
                    style: TextStyle(
                      color: colors,
                    ),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
