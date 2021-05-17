import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context,) {

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.teal,
              child: OrientationBuilder(
                builder: (context, orientation,) => Center(
                  child: Message(deviceOrientation: orientation),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: OrientationBuilder(
              builder: (context, orientation,) => Container(
                color: Colors.white,
                child: Center(
                  child: Message(deviceOrientation: orientation),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Message extends StatelessWidget {
  const Message({
    Key key,
    @required this.deviceOrientation,
  }) : super(key: key);

  final Orientation deviceOrientation;

  @override
  Widget build(BuildContext context) {
    String message;

    if ( deviceOrientation == Orientation.portrait ){
      message = "hello";
    }
    else{
      message = "hello Suuuuuuuuuuuuuuuuuuuuuuuper long";
    }
    return Text(
     message,
      style: TextStyle(color: Colors.black, fontSize: 18),
    );
  }
}
