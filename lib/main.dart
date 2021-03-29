import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: BodyWidget(),
      ),
    );
  }
}

// TODO: When you press the button, change the background color of the app
class BodyWidget extends StatelessWidget {
  //String fruit = 'Apples';
  final colorNotfier = ValueNotifier<Color>(Colors.purple.shade700);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Color>(
      valueListenable: colorNotfier,
      builder: (context, color, child) {
        return Container(
          width: double.infinity,
          height: double.infinity,
          color: color,
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 100),
                Text('Hello'),
                SizedBox(height: 100),
                ElevatedButton(
                  onPressed: () {
                    print('I was clicked.');
                    final randomNumber = Random().nextInt(7);
                    final myNewColor = colorList[randomNumber];

                    colorNotfier.value = myNewColor;
                  },
                  child: Text('Click me'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}


final colorList = <Color>[
  Colors.purple,
  Colors.white,
  Colors.orange,
  Colors.blue,
  Colors.red,
  Colors.pink,
  Colors.lightGreenAccent,
];