import 'package:flutter/material.dart';


import 'package:layout/home_page/home_page_logic.dart';

class BodyWidget extends StatefulWidget {
  @override
  _BodyWidgetState createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  final homePageLogic = HomePageLogic();
  //String fruit = 'Apples';



  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Color>(
      valueListenable: homePageLogic.colorNotfier,
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
                    homePageLogic. changeBackgroundColor();
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


