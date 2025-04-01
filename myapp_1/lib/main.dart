import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('My App_1'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Hello this is the body'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Floating Action Button Clicked!");
        },
        child: Text('Click'),
      ),
    ),
  ));
}
