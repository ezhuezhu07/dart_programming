import 'package:flutter/material.dart';
import 'dart:developer' as devvtools show log;

extension Log on Object {
  void log() => devvtools.log(toString());
}

abstract class CanRun {
  // abstract method
  void run();
}
// Any class that extends this absract class should implement the abstract method (run method should be implemented)

class Cat extends CanRun {
  @override
  void run() {
    // TODO: implement run
  }
}

// ! extends - inherit from particular class (max 1)
// ! with - The with keyword allow you to mix a "mixin" with your class. [inherit more than 1 class]

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
