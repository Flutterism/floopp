import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'floopp',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Floopper(),
    );
  }
}

class Floopper extends StatelessWidget {

  final children = List<Widget>.generate(65, (index) =>
    CupertinoButton(
      child: Text((index * index).toString().padLeft(4, '0'),
        style: GoogleFonts.iBMPlexMono(
          textStyle: TextStyle(
            color: Colors.white,
            letterSpacing: 20,
            fontSize: 25.0
          )
        ),
      ),
      onPressed: (){},
      color: Colors.blueGrey,
    )
  );

  final ScrollController controller = ScrollController();
  final random = Random();

  void _flipFlopp() {
    controller.animateTo(
      random.nextInt(64 * 90).toDouble(),
      duration: Duration(seconds: 3),
      curve: Curves.fastOutSlowIn
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('ƒ(loopp)',
          style: GoogleFonts.iBMPlexMono(
            textStyle: TextStyle(
              color: Colors.white,
            )
          ),
        ),
      ),
      body: Center(
        child: ListWheelScrollView(
          itemExtent: 90,
          children: children,
          controller: controller,
          diameterRatio: 1,
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _flipFlopp,
        tooltip: 'floopp this',
        child: Icon(Icons.radio_button_unchecked),
      ),
    );
  }
}