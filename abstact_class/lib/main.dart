import 'package:flutter/material.dart';
import 'dart:developer' as devvtools show log;

extension Log on Object {
  void log() => devvtools.log(toString());
}

abstract class CanRun {
  // abstract method
  @mustCallSuper
  void run() {
    "CanRun's run function is called".log();
  }
}
// Any class that extends this absract class should implement the abstract method (run method should be implemented)

class Cat extends CanRun {
  @override
  void run() {
    // TODO super.run(); if we want to call the the abstract method of CanRun class
    super.run();
    'Cat is running'.log();
  }
}

// ! extends - inherit from particular class (max 1)
// ! with - The with keyword allow you to mix a "mixin" with your class. [inherit more than 1 class]

void testIt() {
  'testit called'.log();
  final cat = Cat();
  cat.run();
}

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
    testIt();
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: Container(),
    );
  }
}
