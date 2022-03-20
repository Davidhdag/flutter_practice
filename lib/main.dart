import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    Widget Contain(double height, Widget child, Color color) {
      return Container(
        width: 200,
        child: child,
        height: height,
        color: color,
      );
    }

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
      if (colorMap[colorList] == colors.value.toString()) {
        return true;
      } else {
        return false;
      }
    }

    Widget Button(onPressed, String text) {
      return TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: colors),
        ),
      );
    }

    Future<void> _showMyDialog(BuildContext context) async {
      return await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Are you sure?'),
              content: Text('Is that color realy $colorList?'),
              actions: <Widget>[
                Button(() async {
                  return await showDialog(
                      context: context,
                      builder: (context) {
                        if (Test(colors)) {
                          return AlertDialog(
                            content: Text('True'),
                            actions: [
                              Button(() {Navigator.of(context).pop();}, 'Nice'),                              
                            ],                            
                          );
                        } else {
                          return AlertDialog(
                            content: Text('LIAR!'),
                            actions: [
                              Button(() {Navigator.of(context).pop();}, 'Cry'),
                            ],
                          );
                        }
                      }).then((value) => Navigator.of(context).pop());
                }, 'Yes'),
                Button(() {
                  Navigator.of(context).pop();
                }, 'No'),
              ],
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('First App'),
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
              Button(
                () {
                  _showMyDialog(context);
                },
                'Yes',
              ),
              TextButton(
                child: Text(
                  'No',
                  style: TextStyle(
                    color: colors,
                  ),
                ),
                onPressed: () {
                  _rcTap();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
