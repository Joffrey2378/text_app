import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Page extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

//The application should: display the text "Hey there" in the middle of the screen
//and after tapping on the screen a background color should be changed to a random
//color. You can also add any other feature to the app - that adds bonus points

class _PageState extends State<Page> {

  final Random _random = Random();

  Color _backgroundColor = Color(0xFFFFFFFF);
  Color _fontColor = Color(0xFF000000);

  void _changeColor() {
    setState(() {
      _backgroundColor = Color.fromARGB(
        100 +_random.nextInt(256 - 100),
        100 +_random.nextInt(256 - 100),
        100 +_random.nextInt(256 - 100),
        100 +_random.nextInt(256 - 100),
      );
      _fontColor = Color.fromARGB(
        _random.nextInt(256),
        _random.nextInt(256),
        _random.nextInt(256),
        _random.nextInt(256),
      );
    });
  }

  void _changeTextColor() {
    setState(() {
      _fontColor = Color.fromARGB(
        _random.nextInt(256),
        _random.nextInt(256),
        _random.nextInt(256),
        _random.nextInt(256),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crazzy Colors!',
        style: TextStyle(
          color: _backgroundColor,
          fontSize: 25.0
        ),),
        backgroundColor: _fontColor,
      ),
      backgroundColor: _backgroundColor,
      body: InkWell(
        onTap: _changeColor,
        child: Center(
            child: GestureDetector(
              onTap: _changeTextColor,
              child: Container(
                child: Text('Hey there',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: _fontColor,
                    fontWeight: FontWeight.bold
                  )),
              ),
            ),
        ),
      ),
    );
  }
}
