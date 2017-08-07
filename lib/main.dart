import 'package:flutter/material.dart';

void main() {
  runApp(new MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Palette',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Palettes')
        ),
        body: new Text('My Body')
      ),
    );
  }
}